# TaskProcessor =
#   toggle_done: (task_id) ->
#     $.ajax
#       type: 'Post'
#       url: "/tasks/toggle_done/#{task_id}"
#       dataType: "json"
#       error: (jqXHR, textStatus, errorThrown) ->
#         alert 'Sorry, something went wrong!'
#       success: (data, textStatus, jqXHR) ->
#         TaskProcessor.adjust_checkmark(task_id, data)

#   delete: (task_id) ->
#     $.ajax
#       type: 'DELETE'
#       url: "/tasks/#{task_id}"
#       dataType: "json"
#       error: (jqXHR, textStatus, errorThrown) ->
#         alert 'Sorry, something went wrong!'
#       success: (data, textStatus, jqXHR) ->
#         TaskProcessor.removeTask(task_id)

#   update_task: (task_id, input) ->
#     $.ajax
#       type: 'PATCH'
#       url: "/tasks/#{task_id}"
#       dataType: "json"
#       data: {"task": {"description":"#{input}"}}
#       error: (jqXHR, textStatus, errorThrown) ->
#         alert 'Sorry, something went wrong!'
#       success: (data, textStatus, jqXHR) ->
#         console.log 'Updated' 

#   create: (input, user_id) ->
#     $.ajax
#       type: 'POST'
#       url: "/tasks"
#       dataType: "json"
#       data: {"task": {"done":"0", "description":"#{input}", "user_id":"#{user_id}"}}
#       error: (jqXHR, textStatus, errorThrown) ->
#         alert 'Sorry, something went wrong!'
#       success: (data, textStatus, jqXHR) ->
#         window.location.href = data.location

#   toggle_all: () ->
#     $.ajax
#       type: 'POST'
#       url: "/tasks/toggle_all"
#       dataType: "json"
#       error: (jqXHR, textStatus, errorThrown) ->
#         alert 'Sorry, something went wrong!'
#       success: (data, textStatus, jqXHR) ->
#         console.log 'Toggled all'
#         TaskProcessor.mark_all_done()

#   clear_completed: -> 
#     $.ajax
#       type: 'POST'
#       url: "/tasks/clear_completed"
#       dataType: "json"
#       error: (jqXHR, textStatus, errorThrown) ->
#         alert 'Sorry, something went wrong!'
#       success: (data, textStatus, jqXHR) ->
#         TaskProcessor.remove_completed_tasks()

#   adjust_checkmark: (task_id, data) ->
#     mark_to_adjust = $("i[data-task-id=#{task_id}]")
#     mark_to_adjust.toggleClass("task-done-checkmark")

#   removeTask: (task_id) ->
#     task = $("div##{task_id}")
#     task.remove()

#   mark_all_done: () ->
#     done_marks = $('.mark-as-done')
#     done_marks.each ->
#       $(this).addClass("task-done-checkmark") unless $(this).hasClass("task-done-checkmark")

#   remove_completed_tasks: ->
#     completed_tasks = $(".task-done-checkmark")
#     completed_tasks.each ->
#       $(this).parentsUntil('div.row').remove()
      
# jQuery ->
#   mark_as_done = $(".mark-as-done")
#   destroy = $(".destroy")
#   edit_task_form = $('.edit')
#   create = $("#create-btn")
#   toggle_all = $('#toggle-all')
#   clear_completed = $('#clear-completed')
#   user = $('#user-id').data('user-id')

#   mark_as_done.on 'click', () ->
#     task_id = $(this).data('task-id')
#     TaskProcessor.toggle_done(task_id)

#   destroy.on 'click', ->
#     task_id = $(this).data('task-id')
#     TaskProcessor.delete(task_id)

#   edit_task_form.blur ->
#     task = $(this).data('task-id')
#     input = $(this).val()
#     TaskProcessor.update_task(task, input)

#   create.on 'click', ->
#     if user?
#       input = $('#new-todo').val()
#       TaskProcessor.create(input, user)

#   toggle_all.on 'click', ->
#     TaskProcessor.toggle_all()

#   clear_completed.on 'click', ->
#     TaskProcessor.clear_completed()