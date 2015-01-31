App.TasksRoute = Ember.Route.extend

  model: ->
    @store.find 'task'
