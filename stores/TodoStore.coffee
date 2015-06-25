AppDispatcher    = require '../dispatcher/AppDispatcher.coffee'
assign           = require 'object-assign'
{ EventEmitter } = require 'events'

CHANGE_EVENT = 'change'

_todos = {}

create = (text) ->

  id = Date.now()
  _todos[id] =
    id: id,
    complete: false,
    text: text

destroy = (id) -> delete _todos[id]

TodoStore = assign {}, EventEmitter.prototype,

  getAll: -> return _todos

  emitChange: -> @emit CHANGE_EVENT

  addChangeListener: (callback) -> @on CHANGE_EVENT, callback

  removeChangeListener: (callback) -> @removeListener CHANGE_EVENT, callback

  dispatcherIndex: AppDispatcher.register (payload) ->
    action = payload.action
    text   = undefined

    switch action.actionType
      when TodoConstants.TODO_CREATE
        text = action.text.trim()
        if text isnt ''
          create text
          TodoStore.emitChange()

      when TodoConstants.TODO_DELETE
        destroy action.id
        TodoStore.emitChange()

    return yes

module.exports = TodoStore
