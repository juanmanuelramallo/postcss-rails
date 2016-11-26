var gulp = require('gulp')
var postcss = require('gulp-postcss')
var browserSync = require('browser-sync').create()
var del = require('del');
var rename = require('gulp-rename')

var rucksack = require('rucksack-css')
var cssnext = require('postcss-cssnext')
var cssnested = require('postcss-nested')
var mixins = require('postcss-mixins')
var lost = require('lost')
var atImport = require('postcss-import')
var csswring = require('csswring') /* Minimificador */
var materialShadow = require('postcss-material-shadow-helper')
var instagram = require('postcss-instagram')
var fontMagician = require('postcss-font-magician')
var getColor = require('postcss-get-color')

gulp.task('clean', function () {
  del('./public/assets/stylesheets');
});

gulp.task('css', function(){
  var processors = [
    atImport({
      path: ["./gulp/stylesheets"]
    }),
    fontMagician(),
    getColor(),
    cssnested,
    lost(),
    rucksack(),
    cssnext({ browsers: ['> 5%', 'last 2 versions']}),
    materialShadow(),
    instagram()
    // csswring()
  ]
  return gulp.src('./gulp/stylesheets/main.css')
    .pipe(postcss(processors))
    .pipe(gulp.dest('./public/assets/stylesheets'))
    .pipe(rename({
            suffix: '.self'
        }))
    .pipe(browserSync.stream() )
})

gulp.task('serve', function () {
  browserSync.init({
    proxy: 'localhost:3000',
    files: ['./app/views/**']
  })
})

gulp.task('watch', function(){
  gulp.watch('./gulp/stylesheets/*.css', ['css'])
  gulp.watch('./app/views/**/*.html').on('change', function(){
     browserSync.reload()
   })
})

gulp.task('default', ['watch', 'serve'])
