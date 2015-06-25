Dispatcher = require "./Dispatcher.coffee"
assign     = require "object-assign"

AppDispatcher = assign {}, Dispatcher.prototype,

  handleViewAction: (action) ->
    @dispatch
      source: 'VIEW_ACTION'
      action: action

module.exports = AppDispatcher
