/**
 *  This file contains the variables used in other gulp files
 *  which defines tasks
 *  By design, we only put there very generic config values
 *  which are used in several places to keep good readability
 *  of the tasks
 */

var gutil = require('gulp-util');
var notify = require('gulp-notify');

/**
 *  The main paths of your project handle these with care
 */
exports.paths = {
  src: 'frontend',
  dist: 'public',
  tmp: '.tmp',
  e2e: 'e2e'
};

/**
 *  Wiredep is the lib which inject bower dependencies in your project
 *  Mainly used to inject script tags in the index.html but also used
 *  to inject css preprocessor deps and js files in karma
 */
exports.wiredep = {
  exclude: [/jquery/],
  directory: 'bower_components'
};

/**
 *  Common implementation for an error handler of a Gulp plugin
 */
// Command line option:
//  --fatal=[warning|error|off]
exports.fatalLevel = require('yargs').argv.fatal;

var ERROR_LEVELS = ['error', 'warning'];

// Return true if the given level is equal to or more severe than
// the configured fatality error level.
// If the fatalLevel is 'off', then this will always return false.
// Defaults the fatalLevel to 'error'.
function isFatal(level) {
  return ERROR_LEVELS.indexOf(level) <= ERROR_LEVELS.indexOf(exports.fatalLevel || 'error');
}

exports.errorHandler = function(title) {
  'use strict';

  // All error logged are errors (no warning)
  var level = 'error';

  return function(err) {
    gutil.log(gutil.colors.red('[' + title + ']'), err.toString());
    notify.onError("Error: <%= err.toString() %>");
    this.emit('end');
    if (isFatal(level)) {
      process.exit(1);
    }
  };
};
