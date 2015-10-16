/* jshint esnext: true */

// WebApp
// ======
// An express server using jade, static files and a repl

// Modules
// =======
var http = require( 'http' );
var fs = require( 'fs' );
var path = require( 'path' );
var express = require( 'express' );
var serveStatic = require( 'serve-static' );
var W = require( 'w-js' );
var less = require( 'less' );
var repl = require( 'repl' );
var request = require( 'request' );
var cheerio = require( 'cheerio' );

// Make & Init
// ===========

function makeWebApp () {
    return {
        port: process.env.PORT || 9999,
        isLocal: W.isDefined( process.env.IS_LOCAL ) ? Boolean( process.env.IS_LOCAL ) : false,
        fetchFromSymphonyEvery: 3000,
        symphonyUrl: process.env.SYMPHONY_URL || (function () { throw new Error( 'No SYMPHONY_URL env set' ); }())
    };
}

var initWebApp = W.composePromisers( fetchSymphony,
                                     startAutoFetchSymphony,
                                     makeExpressApp,
                                     makeServer,
                                     makeRepl,
                                     W.makeReporter( 'OK', 'Server running.' ) );

initWebApp( makeWebApp() )
    .success( function ( app ) {
        W.report( 'OK', 'Listening on port:', app.port );
    })
    .error( function ( err ) {
        W.report( 'Error', 'Failed to create app' );
        throw err;
    });

// Promisers
// =========

function fetchSymphony ( app ) {
    return W.promise( function ( resolve, reject ) {
        getDataFromSymphony( app )
            .error( function ( err ) {
                W.report( 'ERROR', 'Failed to load symphony' );
                reject( err );
            })
            .success( function ( data ) {
                app.symphony = cheerio.load( data, { xmlMode: true } );
                resolve( app );
            });
    });    
}

function startAutoFetchSymphony ( app ) {
    return W.promise( function ( resolve, reject ) {
        (function recur () {
            getDataFromSymphony( app )
                .success( function ( data ) {
                    app.symphony = cheerio.load( data );
                    setTimeout( recur, app.fetchFromSymphonyEvery );
                })
                .error( function ( err ) {
                    console.error( 'Failed to fetch from symphony', err );
                    setTimeout( recur, app.fetchFromSymphonyEvery );
                });
        }());
        resolve( app );
    });
}

function makeExpressApp ( app ) {
    return W.promise( function ( resolve, reject ) {

        app.expressApp = express();

        // Jade
        // ----
        app.expressApp.set( 'view engine', 'jade' );
        app.expressApp.set( 'views', path.join( __dirname, 'views' ) );
        if ( true ) { app.expressApp.locals.pretty = true; }

        // Middleware
        // ----------

        // ### Static Files
        app.expressApp.use( serveStatic( path.join( __dirname, 'public' ) ) );

        // ### Errors
        app.expressApp.use( function ( err, req, res, next ) {
            res.status( 500 ).send( '<pre>' + err  + '<pre>' );
        });

        // Routes
        // ------

        // ### Home
        app.expressApp.get( '/', function ( req, res ) {
            res.send( '' );
        });
        app.expressApp.get( '/preview', function ( req, res ) {
            res.render( 'homepage', makeJadeData( app ) );
        });
        
        
        // ### W.js Clientside
        app.expressApp.get( '/W.min.js', W.jsMinMiddleware() );
        
        resolve( app );
    });
}

function makeServer ( app ) {
    return W.promise( function ( resolve, reject ) {
        app.server = http.createServer( app.expressApp );
        app.server.listen( app.port );
        resolve( app );
    });
}

function makeRepl ( app ) {
    return W.promise( function ( resolve, reject ) {
        if ( app.isLocal ) {
            setTimeout( function () {
                var r = repl.start({
                            prompt: "REPL> ",
                            input: process.stdin,
                            output: process.stdout
                        });
                r.context.app = app;
            }, 1000 );
        }
        resolve( app );
    });
}

// Utils
// =====

// Jade
// ----

function makeJadeData ( app ) {
    return {
        title: '',
        W: W,
        symphonyUrl: app.symphonyUrl,
        symphonyNode: app.symphony,
        toCheerio: function ( _, xml ) { return cheerio( W.last( arguments ) ); },
        isLocal: app.isLocal
    };
}

// Get Data From Symphony
// -----------------------
function getDataFromSymphony ( app ) {
    return W.promise( function ( resolve, reject ) {
        request( app.symphonyUrl + 'all/', function ( err, res, body ) {
            if ( err ) {
                return reject( err );
            }
            if ( res.statusCode !== 200 ) {
                return reject( new Error( 'Symphony returned status code ' + res.statusCode ) );
            }
            resolve( body );
        });
    });
}
