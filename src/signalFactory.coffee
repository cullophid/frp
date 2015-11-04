
# Generic factory for creating new Signal types
signalFactory = module.exports = (_read, _write, _init) ->
  _listeners = []
  _value = null # either a specific value or a transform function
  _isDirty = false
  _dependencies = []
  _cache = null
  state =
    emit: () ->
      _isDirty = true
      l() for l in _listeners

    read: () ->
      _cache  = _read(_value, _cache, _isDirty, _dependencies)
      _isDirty = false
      _cache

    write: (value) ->
      _value = _write(value)
      state.emit()

    addListener: (listener) ->
      _listeners.push(listener)

    removeListener: (listener) ->
      _listeners = _listeners.filter ((l) -> l != listener)

    setDependencies: (dependencies) ->
      _dependencies.forEach (d) ->
        d.removeListener state.emit

      dependencies.forEach (d) ->
        d.addListener state.emit

      _dependencies = dependencies

  _init state
