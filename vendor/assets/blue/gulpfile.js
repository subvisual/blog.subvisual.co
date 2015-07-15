var gulp = require('gulp');
var $ = require('gulp-load-plugins')({
  camelize: true
});

var handleError = function(err) {
  console.log(err.toString());
  this.emit('end');
};

gulp.task('scripts', function() {
  return gulp.src('javascripts/blue/**')
    .pipe($.debug({title: 'javascript:'}))
    .pipe($.sourcemaps.init())
    .pipe($.babel())
    .on('error', handleError)
    .pipe($.concat('blue.js'))
    .pipe($.uglify())
    .pipe($.sourcemaps.write('.'))
    .pipe(gulp.dest('dist'));
});

gulp.task('styles', function() {
  return gulp.src('stylesheets/blue.scss')
    .pipe($.debug({title: 'css:'}))
    .pipe($.sourcemaps.init())
    .pipe($.sass({
      includePaths: ['bower_components/']
    }))
    .on('error', handleError)
    .pipe($.autoprefixer({
      browsers: ['last 2 versions'],
      cascade: false
    }))
    .pipe($.concat('blue.css'))
    .pipe($.cssmin())
    .pipe($.sourcemaps.write('.'))
    .pipe(gulp.dest('dist'));
});

gulp.task('default', ['scripts', 'styles']);
