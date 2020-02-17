class Booking < ApplicationRecord
  belongs_to :place
  belongs_to :user

  validates :date, presence: true, allow_blank: false
end
