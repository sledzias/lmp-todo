App.TasksController = Ember.ArrayController.extend
  sortProperties: ['description']
  fields: {}

  completedTasks: ( ->
    @filterBy('done', true).get('length')
    ).property('@each.done')

  activeTasks: ( ->
    @filterBy('done', false).get('length')
    ).property('@each.done')

  allTasks: ( ->
    @get("content.length")
    ).property('content.length')

  actions:
    saveChanges: -> @get('model').save()

    deleteTask:  (task)-> 
      task.destroyRecord().then =>
        @transitionToRoute 'tasks'

    createTask: ->
      description = @get('fields')
      task = @store.createRecord 'task', description
      task.save()
      @set('fields.description', "")

    allDone: ->
      tasks = @filterBy('done', false)
      tasks.setEach('done', true)
      tasks.invoke('save')

    clearCompleted: ->
      tasks = @filterBy('done', true)
      tasks.invoke('deleteRecord')
      tasks.invoke('save')
