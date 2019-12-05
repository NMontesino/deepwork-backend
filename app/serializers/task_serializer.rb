class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :important, :urgent, :user_id
end
