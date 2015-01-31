App.TasksController = Ember.ArrayController.extend
  sortProperties: ['description']

  actions:
    saveChanges: -> @get('model').save()
    deleteTask:  (task)-> 
      task.destroyRecord().then =>
        @transitionToRoute 'tasks'
    createTask: ->
      description = @get('fields')
      task = @store.createRecord 'task', description
      task.save().then =>
        @transitionToRoute 'tasks'

