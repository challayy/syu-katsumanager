class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          :confirmable

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :companies, dependent: :destroy

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  mount_uploader :image, ImageUploader

  attr_accessor :remove_image
end