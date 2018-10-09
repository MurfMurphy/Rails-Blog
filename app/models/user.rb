class User < ApplicationRecord
    has_many :posts
    has_many :comments

    validates_presence_of :username, :fname, :lname, :email, :password

    scope :created_last_week, -> { where('created_at >= ?', 1.week.ago)}
end
