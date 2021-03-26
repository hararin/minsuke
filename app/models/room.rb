class Room < ApplicationRecord
	belongs_to :request
	has_many :user_rooms, dependent: :destroy
	has_many :users, through: :user_rooms
	has_many :posts, dependent: :destroy
end
