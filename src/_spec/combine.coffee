assert = require 'assert'
signal = require '../signal'
combine = require '../combine'

describe 'combine', () ->
  it 'should combine signals', () ->
    s1 = signal 1
    s2 = signal 2
    actual = combine ((a, b) -> a + b), s1, s2

    assert.equal actual(), 3

  it 'should be curried', () ->
    s1 = signal 1
    s2 = signal 2
    add = combine ((a, b) -> a + b)

    assert.equal (add s1, s2)(), 3
