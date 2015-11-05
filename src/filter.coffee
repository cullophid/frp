curryN = require './helpers/curryN'
Maybe = require './helpers/Maybe'
signalFactory = require './signalFactory'
empty = require './empty'

_read = (filter, cache, isDirty, dependencies) ->
  dependency = dependencies[0]
  f = (value) ->
    if filter(value)
      Maybe.of(value)
    else
      Maybe.empty()

  if isDirty then dependency.read().chain f else cache

_write = (filter) -> filter
_init = (state) ->
  (initialValue, dependencies...) ->
    state.write initialValue
    state.setDependencies dependencies

    f = (value) ->
      if value? then state.write value else state.read().extract()
    Object.assign f, state


module.exports = curryN 2, (initialValue, dependencies...) ->
  signal = signalFactory _read, _write
  signal.write initialValue
  signal.setDependencies dependencies
  signal
