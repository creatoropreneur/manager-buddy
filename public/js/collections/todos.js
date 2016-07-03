/*global Backbone */
var app = app || {};

(function () {
	'use strict';

	// Todo Collection
	// ---------------

	var TodoList = Backbone.Collection.extend({
		// Sync this collection with the Rails API
		url: '/projects/' + window.TodoProjectId + '/todos',

		// Reference to this collection's model.
		model: app.Todo,

		// Filter down the list of all todo items that are finished.
		completed: function () {
			return this.filter(function (todo) {
				return todo.get('completed');
			});
		},

		// Filter down the list to only todo items that are still not finished.
		remaining: function () {
			return this.without.apply(this, this.completed());
		},

		// We keep the Todos in sequential order, despite being saved by unordered
		// GUID in the database. This generates the next order number for new items.
		nextOrder: function () {
			if (!this.length) {
				return 1;
			}
			return this.last().get('order') + 1;
		},

        nextTodo: function () {
            if (!this.length) {
                return 1;
            }
            return this.last().get('id') + 1;
        },

		// Todos are sorted by their original insertion order.
		comparator: function (todo) {
			return todo.get('order');
		}
	});

	// Create our global collection of **Todos**.
	app.todos = new TodoList();
})();
