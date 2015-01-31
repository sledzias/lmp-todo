App.Task = DS.Model.extend
  done: DS.attr('boolean')
  description: DS.attr('string')
  user_id: DS.attr('number')