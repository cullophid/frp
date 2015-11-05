signalFactory = require './signalFactory'
Identity = require './helpers/Identity'

_read = (value) -> Identity.of value
_write = (value) -> value

module.exports = (initialValue) ->
  signal = signalFactory _read, _write
  signal.write initialValue
  signal
