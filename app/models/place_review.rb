class PlaceReview < ApplicationRecord
  belongs_to :place
  belongs_to :user

  validates :content, presence: true, allow_blank: false
  validates :rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
