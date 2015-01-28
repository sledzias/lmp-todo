require 'spec_helper'

describe TaskPolicy do

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:task) { create(:task, user_id: other_user.id) }
  subject { TaskPolicy }

  permissions :show?  do
    it "can only be accessed by the user who created it" do
      expect(subject).not_to permit(user, Task.new(user_id: other_user.id, description: 'something'))
    end
  end



  permissions :update? do
    it "can only be accessed by the user who created it" do
      expect(subject).not_to permit(user, Task.new(user_id: other_user.id, description: 'something'))
    end
  end

  permissions :destroy? do
    it "can only be accessed by the user who created it" do
      expect(subject).not_to permit(user, Task.new(user_id: other_user.id, description: 'something'))
    end
  end
end
