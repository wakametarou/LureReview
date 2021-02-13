class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lure

  validates :score, presence: true
end
