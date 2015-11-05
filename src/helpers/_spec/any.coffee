assert = require 'assert'
any = require '../any'

describe 'any', () ->
  it 'should return true if the predicate returns true for any element', () ->
    list = [1, 2, 3, 4]
    assert.equal (any ((i) -> i == 3), list), true

  it 'should return false if the predicate does not return true for any element', () ->
    list = [1, 2, 3, 4]
    assert.equal (any ((i) -> i == 5), list), false
