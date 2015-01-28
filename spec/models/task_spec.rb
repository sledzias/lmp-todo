require 'rails_helper'

RSpec.describe Task, :type => :model do
  describe "Creating new tasks" do
    it "is invalid without description" do
      task = build(:task, description: '')
      task.valid?
      expect(task.errors[:description]).to include("can't be blank")
    end

    it "is valid with description" do
      task = build(:task)
      task.valid?
      expect(task).to be_valid
    end
  end
end
