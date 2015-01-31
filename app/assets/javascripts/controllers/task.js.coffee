App.TaskController = Ember.ObjectController.extend
  
    isDone: ( ->
      done = @get('done')
      done == true
      ).property('done')