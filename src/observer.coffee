observable = module.exports = (f, signal) ->
  exec = () -> signal.read().map f
  signal.addListener(exec)

  exec()

  # returns a function that unsubscribes the observer from all dependencies
  () ->
    s.removeListener(exec) for s in signals
