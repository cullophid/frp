signal = require '../src/signal'
map = require '../src/map'
filter = require '../src/filter'
observer = require '../src/observer'

s1 = signal 1
s2 = signal 2

s3 = map ((a) -> a + 1), s1

observer ((x) -> console.log x), s3
s1 2
s1 3
s1 4
