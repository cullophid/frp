// Generated by CoffeeScript 1.10.0
(function() {
  var apply, observable,
    slice = [].slice;

  apply = require('./apply');

  observable = module.exports = function() {
    var exec, f, i, len, s, signals;
    f = arguments[0], signals = 2 <= arguments.length ? slice.call(arguments, 1) : [];
    exec = function() {
      return apply(f, signals);
    };
    for (i = 0, len = signals.length; i < len; i++) {
      s = signals[i];
      s.addListener(exec);
    }
    exec();
    return function() {
      var j, len1, results;
      results = [];
      for (j = 0, len1 = signals.length; j < len1; j++) {
        s = signals[j];
        results.push(s.removeListener(exec));
      }
      return results;
    };
  };

}).call(this);