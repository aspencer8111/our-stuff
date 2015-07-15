class Item < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :description

  scope :unclaimed, -> { where(user_id: nil) }
end
