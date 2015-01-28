class Task < ActiveRecord::Base
  validates :description, presence: true

  def available?
    self.done == false
  end

  def done?
    self.done == true
  end

  def self.count_tasks(attr)
    if attr == 'active'
      where("done = ?", false).count
    elsif attr == 'completed'
      where("done = ?", true).count
    elsif attr == 'all'
      self.count
    end
  end

  def self.active_tasks
    where("done = ?", false)
  end

  def self.finished_tasks
    where("done = ?", true)
  end

  def self.count_tasks(attr)
    if attr == 'active'
      where("done = ?", false).count
    elsif attr == 'completed'
      where("done = ?", true).count
    elsif attr == 'all'
      self.count
    end
  end
end
