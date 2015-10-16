// Make & Init
// ===========

function make () {
    return {};
}

var init = W.composePromisers( makeRouter, triggerRouter );

$( function () {
    init( make() )
        .success( W.makeReporter( 'OK', 'App Created' ) )
        .error( function ( err ) {
            W.report( 'Error', 'Failed to create app' );
            throw err;
        });
});

// Promisers
// =========

function makeRouter ( app ) {
    return W.promise( function ( resolve, reject ) {
        app.router = new W.Router();

        app.router
            .map( '/:project-cid' ).to( function ( req ) {
                console.log( 'should show', req.params.id );
             });
        
        resolve( app );
    });
}

function triggerRouter ( app ) {
    return W.promise( function ( resolve, reject ) {
        app.router.trigger( window.location.pathname );
        resolve( app );
    });
}

// Utils
// =====

// Navigation
// ----------

function goTo ( app, url, title ) {
    history.pushState( null, title, url );
    app.router.trigger( url );
}
