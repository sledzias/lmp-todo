App.TasksController = Ember.ArrayController.extend
  sortProperties: ['description']
  fields: {}

  actions:
    saveChanges: -> @get('model').save()

    deleteTask:  (task)-> 
      task.destroyRecord().then =>
        @transitionToRoute 'tasks'

    createTask: ->
      description = @get('fields')
      task = @store.createRecord 'task', description
      task.save()

    allDone: ->
      tasks = @filterBy('done', false)
      tasks.setEach('done', true)
      tasks.invoke('save')

    clearCompleted: ->
      tasks = @filterBy('done', true)
      tasks.invoke('deleteRecord')
      tasks.invoke('save')
