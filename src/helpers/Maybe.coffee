Identity = require './Identity'
Empty = () ->
  map: (f) -> Empty()
  extract: () -> null,
  chain: () -> Empty()

module.exports = {
  of: (value) -> Identity.of(value)
  empty: () -> Empty()
}
