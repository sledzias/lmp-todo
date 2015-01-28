TaskProcessor =
  toggle_done: (task_id) ->
    $.ajax
      type: 'Post'
      url: "/tasks/toggle_done/#{task_id}"
      dataType: "json"
      error: (jqXHR, textStatus, errorThrown) ->
        alert 'Sorry, something went wrong!'
      success: (data, textStatus, jqXHR) ->
        console.log 'success'
        TaskProcessor.adjust_checkmark(task_id, data)

  adjust_checkmark: (task_id, data) ->
    mark_to_adjust = $("i[data-task-id=#{task_id}]")
    mark_to_adjust.toggleClass("task-done-checkmark")

jQuery ->
  mark_as_done = $(".mark-as-done")

  mark_as_done.on 'click', () ->
    task_id = $(this).data('task-id')
    TaskProcessor.toggle_done(task_id)