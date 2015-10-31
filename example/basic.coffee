{signal, observer, map} = require '../src'

s1 = signal 1

s2 = map ((s1) -> Promise.resolve(s1 + 1)), s1

observer ((value) -> console.log value), s2

s1 2
s1 3
s1 4
