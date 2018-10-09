class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    
    scope :published_last_week, -> { where('posted_at >= ?', 1.week.ago)}
end
