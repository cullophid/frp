{apply} = require './src/helpers'
dependencies = [
  () -> 1,
  () -> Promise.resolve(2),
  () -> 3
];

console.log 1
apply ((x) -> console.log x), dependencies

console.log 2
