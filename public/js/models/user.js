/*global Backbone */
var app = app || {};

(function () {
    'use strict';

    // Todo Model
    // ----------

    // Our basic **Todo** model has `title`, `order`, and `completed` attributes.
    app.User = Backbone.Model.extend({
        // Sync this model with the Rails API
        urlRoot: '/users/index.json',

        // Default attributes for the todo
        // and ensure that each todo created has `title` and `completed` keys.
        defaults: {
            username: '',
            id: '',
            email: ''
        }
    });
})();
