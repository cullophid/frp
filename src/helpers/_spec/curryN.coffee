assert = require 'assert'
curryN = require '../curryN'

describe 'curryN', () ->
  it 'should return a function', () ->
    f = curryN 2, (a, b) -> a + b
    assert.equal (f 2, 1), 3

  it 'should return a curried function', () ->
    f = curryN 2, (a, b) -> a + b
    assert.equal ((f 1) 2), 3

  it 'should no be broken', () ->
    f = curryN 2, (a, b) -> a + b

    add1 = f 1

    add2 = f 2

    console.log add1 1
    console.log add2 2

    console.log ((f 1) 2)
    assert.equal ((f 1) 2), 3
