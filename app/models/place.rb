class Place < ApplicationRecord
  CATEGORIES = ['Boat', 'Garage', 'Garden', 'Loft', 'Swimming pool', 'Terrace']
  has_many_attached :photos
  belongs_to :user
  has_many :place_reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false, inclusion: { in: CATEGORIES }
  validates :address, presence: true, allow_blank: false
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_city,
      against: [ :address ],
      using: {
        tsearch: { prefix: true }
      }
  pg_search_scope :search_category,
      against: [ :category ]

  def average_rating
    ratings = []
    average = 0
    if place_reviews.present?
      place_reviews.each { |place_review| ratings << place_review.rating }
      average = ratings.sum.fdiv(place_reviews.count).round(1).to_i
    else
      average = "-"
    end
  end

end
