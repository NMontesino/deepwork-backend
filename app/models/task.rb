class Task < ApplicationRecord
    belongs_to :user
    validates :name, :important, :urgent, :user_id, presence: true
    validates :name, uniqueness: true
end
