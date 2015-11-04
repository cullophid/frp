module.exports = (f) ->
  cache = undefined
  get = (args...) ->
    if cache == undefined
      cache = f(args...)
    cache

  get.clearCache = () ->
    cache = undefined
  get
