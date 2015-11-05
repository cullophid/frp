signalFactory = require './signalFactory'
curryN = require './helpers/curryN'
apply = require './helpers/apply'
Future = require './helpers/Future'

_read = (value, cache, isDirty, dependencies) ->
  if isDirty
    Future.of (apply value, dependencies)
  else
    cache

_write = (value) -> value

module.exports = curryN 2, (initialValue, dependencies...) ->
  console.log initialValue, dependencies
  signal = signalFactory _read, _write
  signal.write initialValue
  signal.setDependencies dependencies
  signal
