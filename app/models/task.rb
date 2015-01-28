class Task < ActiveRecord::Base
  validates :description, presence: true

  def available?
    self.done == false
  end

  def done?
    self.done == true
  end
end
