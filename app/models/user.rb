class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    has_many :forum_threads, dependent: :destroy
    has_many :forum_thread_comments, dependent: :destroy
end
