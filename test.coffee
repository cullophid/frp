S = require 'sanctuary'

maybe5 = S.Maybe.of(5)


f = (value) ->
  S.Left value + 2


console.log maybe5.chain(f)
