class User < ApplicationRecord

    has_secure_password

    has_many :tasks, dependent: :destroy
    validates :username, :password, presence: true
    validates :username, uniqueness: true

    validates :password_confirmation, presence: false, :on => :create

end
