class Group < ApplicationRecord
  belongs_to :user
  belongs_to :server
  has_many :requests
  has_rich_text :description

  default_scope { order(created_at: :desc) }
end
