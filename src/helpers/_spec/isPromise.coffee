assert = require 'assert'
isPromise = require '../isPromise'

describe 'isPromise', () ->
  it 'should return true if given a promise', () ->
    prom = Promise.resolve 1
    assert.equal (isPromise prom), true

  it 'should return false if given undefined', () ->
    prom = undefined
    assert.equal (isPromise prom), false

  it 'should return false if given any other value', () ->
    prom = 1
    assert.equal (isPromise prom), false
