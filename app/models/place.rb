class Place < ApplicationRecord
  belongs_to :user
  has_many :place_reviews
  has_many :bookings

  validates :title, presence: true, allow_blank: false
  validates :type, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
end
