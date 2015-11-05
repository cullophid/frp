module.exports = (n, f) ->
  (args...) ->
    _args = []
    curried = (args...) ->
      _args = [_args..., args...]
      if _args.length >= n then (f _args...) else curried
    curried(args...)
