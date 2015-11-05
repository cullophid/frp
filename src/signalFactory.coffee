# Generic factory for creating new Signal types
signalFactory = module.exports = (_read, _write) ->
  _listeners = []
  _value = null # either a specific value or a transform function
  _isDirty = false
  _name = null
  _dependencies = []
  _cache = null

  # single function interface for the signal
  getSet = (state) -> (value) ->
    if value? then state.write value else state.read().extract()

  state =
    setName: (name) -> _name = name
    getName: () -> _name
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

  Object.assign getSet(state), state
