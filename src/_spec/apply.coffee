assert = require 'assert'
apply = require '../apply'
sinon = require 'sinon'

describe 'apply', () ->
  it 'it should call the function with the given arguments if no values are promises', () ->
    values = [(() -> 1), (() -> 2)]
    spy = sinon.spy()
    apply spy, values
    assert.equal spy.calledOnce, true
    assert.deepEqual spy.args[0], [1, 2]

  it 'it should call the function with the resoved values if the values are promises', () ->
    values = [(() -> Promise.resolve(1)), (() -> Promise.resolve(2))]
    spy = sinon.spy()
    apply spy, values
      .then () ->
        assert.equal spy.calledOnce, true, 'Should call the spy'
        assert.deepEqual spy.args[0], [1, 2]

  it 'it should call the function with the resoved values if any values are promises', () ->
    values = [(() -> Promise.resolve(1)), (() -> 2)]
    spy = sinon.spy()
    apply spy, values
      .then () ->
        assert.equal spy.calledOnce, true, 'Should call the spy'
        assert.deepEqual spy.args[0], [1, 2]
