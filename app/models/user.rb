class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :nullify
  has_many :ratings, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :replies, dependent: :nullify
  validates :nickname, uniqueness: true
  validates :level, presence: true, inclusion: { in: ["starter", "intermediate", "pro", "expert"] }
  validates :slogan, presence: true, length: { in: 10..100 }
end
