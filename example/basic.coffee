{signal, observer, map} = require '../src'

s1 = signal 0

s2 = signal 0

observer ((value) -> console.log value), s2

s1 2
s1 3
