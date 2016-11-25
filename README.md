# Using Postcss in Ruby on Rails - BrowserSync with Gulp

## Pasos para configurar
_Aplicación de Rails ya creada_

- Ejecutar `npm init` y configurar el **package.json**
- Instalar gulp localmente `npm install gulp`
- Agregar en el .gitignore la carpeta /node_modules
- Crear archivo **gulpfile.js** en directorio raíz
- En **config/application.rb** requerir los archivos:
      config.assets.paths << Rails.root.join("public", "assets", "stylesheets")
      config.assets.paths << Rails.root.join("public", "assets", "javascripts")
- En **app/assets/stylesheets/application.css** requerir el archivo de salida que está en public:
`*= require main`
- En **config/environments/development.rb** configurar (para aprovechar BroswerSync):
      config.assets.debug = true
      config.assets.digest = false
- En **package.json** agregar en *scripts* lo siguiente para limpiar y compilar:
      "postinstall": "gulp clean; gulp css;"
- Para usar un plugin de postcss primero se debe instalar usando `npm install --save-dev [nombre_plugin]`

## El archivo gulpfile.js

- Se deben requerir los siguiente módulos:
            var gulp = require('gulp')
            var postcss = require('gulp-postcss')
            var browserSync = require('browser-sync').create()
            var del = require('del');
            var rename = require('gulp-rename')
- Y adicionalmente las partes de postcss que se desean usar (ver http://postcss.parts):
            var rucksack = require('rucksack-css')
            var cssnext = require('postcss-cssnext')
            var autoprefixer = require('autoprefixer')
            var cssnested = require('postcss-nested')
            var mixins = require('postcss-mixins')
            var lost = require('lost')
            var atImport = require('postcss-import')
            var csswring = require('csswring')
            var materialShadow = require('postcss-material-shadow-helper')
            var instagram = require('postcss-instagram')
            var coloralpha = require('postcss-color-alpha')
- Deberá tener las siguientes cuatro fuciones principales:

            gulp.task('clean', function () {
              del('./public/assets/stylesheets');
            });

            gulp.task('serve', function () {
              browserSync.init({
                proxy: 'localhost:3000',
                files: ['./app/views/**']
              })
            })

            gulp.task('css', function(){
              var processors = [
                atImport({
                  path: ["./gulp/stylesheets"]
                }),
                cssnested,
                lost(),
                rucksack(),
                cssnext({ browsers: ['> 1%', 'last 3 versions', 'ie 8']}),
                materialShadow(),
                instagram(),
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

            gulp.task('watch', function(){
              gulp.watch('./gulp/stylesheets/*.css', ['css'])
              gulp.watch('./app/views/**/*.html').on('change', function(){
                 browserSync.reload()
               })
            })

            gulp.task('watch', function(){
              gulp.watch('./gulp/stylesheets/*.css', ['css'])
              gulp.watch('./app/views/**/*.html').on('change', function(){
                 browserSync.reload()
               })
            })

            gulp.task('default', ['watch', 'serve'])

## Consideraciones

Las carpetas del código fuente deberán estar en **/gulp/assets** (crear la carpeta)

Todo lo que deberá ser procesado por Gulp y Postcss Lo compilado irá directo a **/public/assets**
