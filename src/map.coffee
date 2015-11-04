signalFactory = require './signalFactory'
Identity = require './Identity'
Future = require './Future'

getSet = (state) -> (value) ->
  if value? then state.write value else state.read().extract()

_read = (value, cache, isDirty, dependencies) ->
  dependency = dependencies[0]
  f = (input) ->
    Future.of value input
  if isDirty
    dependency
      .read()
      .chain f
  else
    cache

_write = (value) -> value

_init = (state) ->
  (initialValue, dependencies...) ->
    console.log 'f', initialValue
    dependencies[0].read?().map(console.log)
    state.write initialValue
    state.setDependencies dependencies

    Object.assign getSet(state), state

module.exports = signalFactory _read, _write, _init
