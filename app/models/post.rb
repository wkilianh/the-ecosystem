class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, through: :comments, dependent: :destroy

  has_many_attached :photos
  has_rich_text :rich_body

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

  # def rating_avg
  #   if self.ratings.exists?
  #     self.ratings.last.avg
  #   else
  #     0
  #   end
  # end

  def current_rating
    if self.ratings.exists?
      ratings = Rating.all.where(post_id: self.id)
      rating_co2 = ratings.sum("co2") / ratings.count
      rating_waste = ratings.sum("waste") / ratings.count
      rating_resources = ratings.sum("resources") / ratings.count
      rating_diyeffort = ratings.sum("diyeffort") / ratings.count
      rating_ecocost = ratings.sum("ecocost") / ratings.count
      rating_avg = ratings.sum("avg") / ratings.count
      { co2: rating_co2, waste: rating_waste, resources: rating_resources,
       diyeffort: rating_diyeffort, ecocost: rating_ecocost, avg: rating_avg }
    else
      { co2: 0, waste: 0, resources: 0, diyeffort: 0, ecocost: 0, avg: 0}
    end
  end

end
