apply = require './apply'
observable = module.exports = (f, signals...) ->
  exec = () -> apply f, signals
  s.addListener(exec) for s in signals

  exec()

  () ->
    s.removeListener(exec) for s in signals
