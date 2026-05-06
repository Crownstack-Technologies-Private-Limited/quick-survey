class Folder < ApplicationRecord
  belongs_to :space
  belongs_to :user
  validates :title, presence: true
  has_many :survey_surveys, class_name: "Survey::Survey", dependent: :destroy
end
