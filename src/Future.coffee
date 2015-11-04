Identity = require './Identity'
{isPromise} = require './helpers'
Future = {
  of: (_value) ->
    if isPromise _value
      {
        map: (f) -> _value.then(f),
        extract: () -> _value,
        chain: (f) -> f(value)
      }
    else
      Identity.of(_value)
}

module.exports = Object.assign ((f) -> Future.of(new Promise (resolve) -> f(resolve))), Future
