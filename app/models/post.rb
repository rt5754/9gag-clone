class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum: 25 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
  acts_as_votable
end
