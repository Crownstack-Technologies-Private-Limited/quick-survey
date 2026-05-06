class Account < ApplicationRecord
  validates :name, presence: true
  belongs_to :owner, class_name: "User", optional: true
end
