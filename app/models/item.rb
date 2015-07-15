class Item < ActiveRecord::Base
  belongs_to :user

  has_attached_file :picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '900x900'
  }

  validates_presence_of :name, :description
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  scope :unclaimed, -> { where(user_id: nil) }
end
