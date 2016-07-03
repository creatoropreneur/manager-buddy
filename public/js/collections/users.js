/*global Backbone */
var app = app || {};

(function () {
    'use strict';

    // Todo Collection
    // ---------------

    var UserList = Backbone.Collection.extend({
        // Sync this collection with the Rails API
        url: '/users/index.json',

        // Reference to this collection's model.
        model: app.User
    });

    // Create our global collection of **Todos**.
    app.users = new UserList();
})();
