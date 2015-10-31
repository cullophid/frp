observable = module.exports = (f, signals...) ->
  exec = () ->
    args = signals
      .map((s) -> s())
      .filter((x) -> x != undefined)

    f(args...) if args.length > 0

  s.addListener(exec) for s in signals

  exec()

  () ->
    s.removeListener(exec) for s in signals
