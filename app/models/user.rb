class User < ApplicationRecord
    has_many :tasks, dependent: :destroy
    validates :username, :password, presence: true
    validates :username, uniqueness: true
end
