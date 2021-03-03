class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, through: :comments, dependent: :destroy

  has_many_attached :photos
  has_rich_text :rich_body

  # just for testing
  # validates :title, :topic, :category, presence: true
  # validates :category, inclusion: { in: ["hack", "don't", "project"] }
  # validates :expect_co2, :expect_waste, :expect_resources,
  #           :expect_diyeffort, :expect_ecocost, presence: true,
  #           inclusion: { in: ["modest", "moderate", "good", "strong"] }

end
