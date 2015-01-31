App.TaskController = Ember.ObjectController.extend
  
    isDone: ( ->
      done = @get('done')
      done == true
      ).property('done')

    actions:
      markAsDone: ->
        done = @get('done')
        if done == true
          @set('done', false)
        else if done == false
          @set('done', true)
        @get('model').save()