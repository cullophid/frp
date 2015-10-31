assert = require 'assert'
helpers = require '../helpers'

describe 'Helpers', () ->
  describe 'any', () ->
    it 'should return true if the predicate returns true for any element', () ->
      list = [1, 2, 3, 4]
      assert.equal (helpers.any ((i) -> i == 3), list), true

    it 'should return false if the predicate does not return true for any element', () ->
      list = [1, 2, 3, 4]
      assert.equal (helpers.any ((i) -> i == 5), list), false

  describe 'isPromise', () ->
    it 'should return true if given a promise', () ->
      prom = Promise.resolve 1
      assert.equal (helpers.isPromise prom), true

    it 'should return false if given undefined', () ->
      prom = undefined
      assert.equal (helpers.isPromise prom), false

    it 'should return false if given any other value', () ->
      prom = 1
      assert.equal (helpers.isPromise prom), false
