class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum: 25 }
  validates :user_id, presence: true
  acts_as_votable
end
