var gulp = require('gulp'),
    plugins = require('gulp-load-plugins')();
var asset = {
    js: './public/**/*.js',
    css: './public/**/*.css',
    html: './public/**/*.html',
    public: './public'
};
gulp.task('default', ['minCss', 'minHtml','minJs']);
gulp.task('minCss', function () {
    return gulp.src(asset.css)
        .pipe(plugins.minifyCss())
        .pipe(gulp.dest(asset.public));
});
gulp.task('minJs', function () {
    return gulp.src(asset.js)
        // .pipe(plugins.babel())
        // .pipe(plugins.uglify())
        .pipe(plugins.rename({suffix: '.min'}))
        .pipe(gulp.dest(asset.public));
});
gulp.task('minHtml', function () {
    var options = {
        removeComments: true,//清除HTML注释gulp
        collapseWhitespace: true,//压缩HTML
        collapseBooleanAttributes: false,//省略布尔属性的值 <input checked="true"/> ==> <input />
        removeEmptyAttributes: true,//删除所有空格作属性值 <input id="" /> ==> <input />
        removeScriptTypeAttributes: false,//删除<script>的type="text/javascript"
        removeStyleLinkTypeAttributes: false,//删除<style>和<link>的type="text/css"
        minifyJS: true,//压缩页面JS
        minifyCSS: true//压缩页面CSS
    };
    gulp.src(asset.html)
        .pipe(plugins.htmlmin(options))
        .pipe(gulp.dest(asset.public));
});
