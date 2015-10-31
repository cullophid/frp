signal = require './src/signal'
observer = require './src/observer'

s1 = signal 0

s2 = signal ((n) -> n + 1), s1
s3 = signal ((n) -> n + 1), s2
s4 = signal ((n) -> n + 1), s3

observer ((x) -> console.log x), s4

s1 1
s1 2
