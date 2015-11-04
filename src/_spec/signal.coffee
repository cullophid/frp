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
