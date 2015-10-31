
exports.any = (f, list) ->
  for e in list
    if f(e) then return true
  false


exports.isPromise = (e) -> e? and typeof e.then == 'function'
