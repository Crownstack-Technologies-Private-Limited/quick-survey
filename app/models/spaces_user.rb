class SpacesUser < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :user_id, uniqueness: { scope: :space_id }
end
