class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :items, dependent: :destroy
  has_many :reservations_made_on_other_items, class_name: "Reservation"
  has_many :reservations_on_own_items, through: :items, source: :reservations
end
