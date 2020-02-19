class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :places, dependent: :destroy
  has_many :user_reviews
  has_many :place_reviews
  has_many :bookings, dependent: :destroy

  validates :last_name, presence: true, allow_blank: false
  validates :first_name, presence: true, allow_blank: false
  validates :birth_date, presence: true, allow_blank: false
end
