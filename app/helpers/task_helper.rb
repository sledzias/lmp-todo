module TaskHelper
  
  def self.get_task_status_class(task)
    return 'done' if task.done
    'notdone'
  end
    
end