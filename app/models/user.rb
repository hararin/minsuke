class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requests
  has_many :participants
  has_many :purchases
  has_many :reports
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :posts
  has_many :keeps
  has_many :evaluations
  has_many :another_evaluations
  has_many :questions
  has_many :answers

  validates :name, presence: true
  validates :ticket, presence: true

  attachment :image

  include Discard::Model
end
