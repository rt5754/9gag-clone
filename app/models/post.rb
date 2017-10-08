class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum: 25 }
  validates :user_id, presence: true
  validates :image, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :image
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes
  acts_as_votable
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
