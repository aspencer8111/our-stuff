class Item < ActiveRecord::Base
  belongs_to :user

  scope :unclaimed, -> { where(user_id: nil) }
end
