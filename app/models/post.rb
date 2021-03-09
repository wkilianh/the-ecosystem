class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, through: :comments, dependent: :destroy

  has_many_attached :photos
  has_rich_text :rich_body

  include PgSearch::Model
  pg_search_scope :search_post,
    against: [ :title, :topic, :category, :expect_co2 ],
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

  def current_rating
    ratings = Rating.all.where(post_id: self.id)

  end

end
