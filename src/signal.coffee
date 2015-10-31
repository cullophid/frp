cache = require './signalCache'
signal = module.exports = (initialValue, dependencies...) ->
  listeners = []
  _value = null # either a specific value or a transform function

  emit = () ->
    _value.clearCache?()
    l() for l in listeners

  write = (value) ->
    if typeof value == 'function'
      _value = cache(value)
    else
      _value = value
    emit()

  read = () ->
    if typeof _value == 'function'
      _value(dependencies.map((s) -> s())...)
    else
      _value

  write initialValue
  d.addListener(emit) for d in dependencies

  getSet = (value) ->
    if value? then write value else read()

  Object.assign getSet, {
    addListener: (listener) ->
      listeners.push(listener)

    removeListener: (listener) ->
      listeners = listeners.filter ((l) -> l != listener)
  }
