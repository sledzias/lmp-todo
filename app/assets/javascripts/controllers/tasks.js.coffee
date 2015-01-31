App.TasksController = Ember.ArrayController.extend
  sortProperties: ['description']

  actions:
    saveChanges: -> @get('model').save()
    deleteTask:  (task)-> 
      task.destroyRecord().then =>
        @transitionToRoute 'tasks'