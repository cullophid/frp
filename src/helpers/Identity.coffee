Identity = module.exports =
  of: (value) ->
    {
      map: (f) ->
        Identity.of f value

      extract: () -> value,
      chain: (f) -> f value
    }
