class TaskSerializer < ActiveModel::Serializer
  attributes :id, :done, :description, :user_id
end