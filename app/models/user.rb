class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :reservations_made_on_other_items, class_name: "Reservation"
  has_many :reservations_on_own_items, through: :items, source: :reservations

  has_one_attached :profile_picture

  validates :username, presence: true, uniqueness: true

  # messaging related
  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions

  def existing_chats_users
    existing_chat_users = []
    self.chats.each do |chat|
    existing_chat_users.concat(chat.subscriptions.where.not(user_id: self.id).map { |subscription| subscription.user })
    end
    existing_chat_users.uniq
  end

end
