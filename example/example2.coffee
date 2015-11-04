signal = require '../src/signal'
map = require '../src/map'
filter = require '../src/filter'
observer = require '../src/observer'

s1 = signal 's1'

s2 = map ((x) ->
  console.log 'calling S2'
  x + ', s2'), s1

s3 = map ((x) ->
  console.log ' calling s3'
  x + ', s3'), s2
# s4 = map ((x) -> x + ' S4'), s2
# observer ((x) -> console.log x), s3
# observer ((x) -> console.log x), s4

console.log s3()
# s1 'yo'
