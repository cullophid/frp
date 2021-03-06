// Generated by CoffeeScript 1.10.0
(function() {
  var any, isPromise, ref;

  ref = require('./helpers'), any = ref.any, isPromise = ref.isPromise;

  module.exports = function(f, args) {
    var values;
    values = args.map(function(d) {
      return d();
    });
    if (any(isPromise, values)) {
      return Promise.all(values).then(function(resolvedValues) {
        return f.apply(null, resolvedValues);
      });
    } else {
      return f.apply(null, values);
    }
  };

}).call(this);
ues);
      assert.equal(spy.calledOnce, true);
      return assert.deepEqual(spy.args[0], [1, 2]);
    });
    it('it should call the function with the resoved values if the values are promises', function() {
      var spy, values;
      values = [
        (function() {
          return Promise.resolve(1);
        }), (function() {
          return Promise.resolve(2);
        })
      ];
      spy = sinon.spy();
      return apply(spy, values).then(function() {
        assert.equal(spy.calledOnce, true, 'Should call the spy');
        return assert.deepEqual(spy.args[0], [1, 2]);
      });
    });
    return it('it should call the function with the resoved values if any values are promises', function() {
      var spy, values;
      values = [
        (function() {
          return Promise.resolve(1);
        }), (function() {
          return 2;
        })
      ];
      spy = sinon.spy();
      return apply(spy, values).then(function() {
        assert.equal(spy.calledOnce, true, 'Should call the spy');
        return assert.deepEqual(spy.args[0], [1, 2]);
      });
    });
  });

}).call(this);
