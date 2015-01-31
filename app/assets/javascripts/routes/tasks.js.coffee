App.TasksRoute = Ember.Route.extend

  # model: ->
  #   @store.find 'task'

  setupController: (controller) ->
    controller.set 'model', @store.find 'task'
    controller.set 'fields', {}