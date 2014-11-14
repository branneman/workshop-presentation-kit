const fs      = require('fs');
const argv    = require('minimist')(process.argv.slice(2));
const express = require('express');
const swig    = require('swig');
const marked  = require('marked');

// Presentation outline
const outline = require('./content/outline');

// App & view configuration
var app = express();
app.set('views', __dirname + '/view');
app.set('view engine', 'swig');
app.engine('.swig', swig.renderFile);
app.disable('x-powered-by');
app.disable('view cache');
swig.setDefaults({cache: false});

//
// Define endpoints
//
app.use('/static', express.static(__dirname + '/static'));

// Global overview
app.get('/', function(req, res) {
    res.render('overview', { outline: outline });
});

// Chapter overview
app.get('/chapter/:chapter', function(req, res, next) {

    var chapterID = req.params.chapter.split('-')[0];
    if (!outline.chapters[chapterID]) return next();

    res.render('chapter', {
        outline: outline,
        chapterID: chapterID,
        chapter: outline.chapters[chapterID]
    });
});

// Pages inside the chapter
app.get('/chapter/:chapter/:page', function(req, res, next) {

    var chapterID = req.params.chapter.split('-')[0];
    if (!outline.chapters[chapterID]) return next();

    var pageID = req.params.page.split('-')[0];
    if (!outline.chapters[chapterID].pages[pageID]) return next();

    var mdFile = 'content/chapters/' + req.params.chapter + '/' + req.params.page + '.md';
    if (!fs.existsSync(mdFile)) return next();

    res.render('page', {
        content: marked(fs.readFileSync(mdFile, {encoding: 'utf8'})),
        outline: outline,
        chapterID: chapterID,
        chapter: outline.chapters[chapterID],
        pageID: pageID,
        page: outline.chapters[chapterID].pages[pageID]
    });
});

// 404
app.use(function(req, res) {
    res.status(404).end('404');
});

//
// Start listening
//
var server = app.listen(argv.port || 80, function() {
    console.log('Workshop available at port %s', server.address().port);
});
