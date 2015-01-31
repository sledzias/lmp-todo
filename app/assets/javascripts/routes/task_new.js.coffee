App.TasksNewRoute = Ember.Route.extend
  # activate: ->
  # deactivate: ->
  # setupController: (controller, model)->
  # renderTemplate: ->
  # beforeModel: ->
  # afterModel: ->

  setupController: (controller) ->
    controller.set 'fields', {}
