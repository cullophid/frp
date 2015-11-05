any = require './any'
isPromise = require './isPromise'
module.exports = (f, dependencies) ->
  values = dependencies.map (d) -> d()
  if (any isPromise, values)
    Promise.all(values)
      .then (values) -> f values...
  else
    f values...
