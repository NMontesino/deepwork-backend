class UserSerializer < ActiveModel::Serializer
  has_many :tasks
  attributes :id, :username, :password
end
