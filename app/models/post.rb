class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, through: :comments, dependent: :destroy

  has_many_attached :photos
  has_rich_text :rich_body

  validates :category, inclusion: { in: %w[hack don't projects] }

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :title, :topic, :category ],
    using: {
    tsearch: { prefix: true }
    }

  # just for testing disabled everything TODO: uncomment if forms are there
  # validates :title, :topic, :category, presence: true
  validates :title, :rich_body, presence: true
  validates :category, presence: true, inclusion: { in: ["hack", "don't", "project"] }
  validates :expect_co2, :expect_waste, :expect_resources,
            :expect_diyeffort, :expect_ecocost, presence: true,
            inclusion: { in: ["low", "moderate", "medium", "high", "very high"] }

  def rating_avg
    if self.ratings.exists?
      self.ratings.last.avg
    else
      0
    end
  end

end
