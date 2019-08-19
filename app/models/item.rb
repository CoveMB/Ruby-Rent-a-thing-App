class Item < ApplicationRecord
  has_many :reservations, dependent: :destroy

  belongs_to :category
  belongs_to :user

  has_one_attached :image

  validates :title, presence: true, length: { in: 5..80 }
  validates :description, presence: true, length: { in: 30..800 }
  # validates :availability_date_start, presence: true
  # validates :availability_date_end, presence: true
end
