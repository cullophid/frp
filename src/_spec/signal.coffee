assert = require 'assert'
signal = require '../signal'

describe 'Signal', () ->
  it 'should return the stored value', () ->
    sig = signal 5
    assert.equal sig(), 5

  it 'should return an updated value', () ->
    sig = signal 5
    sig 6
    assert.equal sig(), 6


  it 'should call all dependants when updating value', () ->
    sig1 = signal 5
    sig2 = signal ((s) => s + 1), sig1
    sig1 6
    assert.equal sig2(), 7
