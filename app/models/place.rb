class Place < ApplicationRecord
  CATEGORIES = ['Boat', 'Garage', 'Garden', 'Loft', 'Swimming pool', 'Terrace']

  belongs_to :user
  has_many :place_reviews
  has_many :bookings, dependent: :destroy

  validates :title, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false, inclusion: { in: CATEGORIES }
  validates :address, presence: true, allow_blank: false
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
end
