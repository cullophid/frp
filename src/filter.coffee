signalFactory = require './signalFactory'
Maybe = require './Maybe'
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


module.exports = signalFactory _read, _write, _init
