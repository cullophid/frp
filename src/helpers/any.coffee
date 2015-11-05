module.exports = (f, list) ->
  for e in list
    if f(e) then return true
  false
