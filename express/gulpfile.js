// Modules
// =======
var path = require( 'path' );
var gulp = require( 'gulp' );
var less = require( 'gulp-less' );
var sourcemaps = require( 'gulp-sourcemaps' );
var autoprefixer = require( 'gulp-autoprefixer' );
var uglify = require( 'gulp-uglify' );
var concat = require( 'gulp-concat' );
var plumber = require( 'gulp-plumber' );
var livereload = require( 'gulp-livereload' );
var babel = require( 'gulp-babel' );

// Basic
// =====

gulp.task( 'default', [ 'less', 'js', 'js-libs', 'copy' ] );

gulp.task( 'watch', function () {
    livereload.listen();
    gulp.watch( './assets/**/*.less', [ 'less' ] );
    gulp.watch( './assets/js/**/*.js', [ 'js' ] );
    gulp.watch( './assets/js-libs/**/*.js', [ 'js' ] );
    gulp.watch( './**/*.jade', [ 'jade' ] );
    gulp.watch( './assets/copy/**/*', [ 'copy' ] );
});

// Tasks
// =====

gulp.task( 'jade', function () {
    return gulp
        .src( './**/*.jade' )
        .pipe( livereload() );
});

gulp.task( 'less', function () {
    return gulp
        .src( './assets/less/all.less' )
        .pipe( plumber() )
        .pipe( sourcemaps.init() )
        .pipe( less() )
        .pipe( autoprefixer( { browsers: [ 'last 2 versions', 'Explorer >= 9' ] }) )
        .pipe( sourcemaps.write() )
        .pipe( gulp.dest( './public/css' ) )
        .pipe( livereload() );
});

gulp.task( 'js', function () {
    return gulp
        .src( [ './assets/js/main.js' ])
        .pipe( plumber() )
        .pipe( sourcemaps.init() )
        .pipe( babel() )
        .pipe( concat( 'all.js' ) )
        .pipe( uglify() )
        .pipe( sourcemaps.write() )
        .pipe( gulp.dest( './public/js' ) )
        .pipe( livereload() );
});

gulp.task( 'js-libs', function () {
    return gulp
        .src( [ './assets/js-libs/jquery*' , './assets/js-libs/*.js' ] )
        .pipe( plumber() )
        .pipe( concat( 'libs.js' ) )
        .pipe( uglify() )
        .pipe( gulp.dest( './public/js' ) )
        .pipe( livereload() );
});

gulp.task( 'copy', function () {
    gulp.src( [ './assets/copy/**/*', './assets/copy/**/*.psd', './assets/copy/**/*.ai', './assets/copy/**/*.afdesign' ] )
        .pipe(gulp.dest( './public/' ));
});

