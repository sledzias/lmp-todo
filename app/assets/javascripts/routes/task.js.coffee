App.TaskRoute = Ember.Route.extend

  model: (params) -> @store.find 'task', params.id
