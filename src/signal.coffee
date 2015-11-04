signalFactory = require './signalFactory'
Identity = require './Identity'

_read = (value) -> Identity.of value
_write = (value) -> value
_init = (state) ->
  (initialValue) ->
    state.write initialValue
    f = (value) ->
      if value? then state.write value else state.read().extract()

    Object.assign f, state

module.exports = signalFactory(_read, _write, _init)
