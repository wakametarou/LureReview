class Lure < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
