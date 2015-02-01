class Task < ActiveRecord::Base
  belongs_to :user
  validates :description, presence: true, allow_blank: false
  
  def mark_as_complete
    self.done= done ? false : true
    save
  end
  
end
