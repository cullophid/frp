{any, isPromise} = require './helpers'
module.exports = (f, args) ->
  values = args.map (d) -> d()
  if any isPromise, values
    Promise.all values
      .then (resolvedValues) -> f resolvedValues...
  else f values...
