class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, through: :comments, dependent: :destroy

  has_many_attached :photos
  has_rich_text :rich_body

  include PgSearch::Model
  pg_search_scope :search_post,
    against: [ :title, :topic, :category ],
    using: {
    tsearch: { prefix: true }
    }

  # just for testing disabled everything TODO: uncomment if forms are there
  # validates :title, :topic, :category, presence: true
  validates :title, presence: true, length: { in: (10..100) }
  validates :rich_body, :topic, presence: true
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

  def current_rating # redundant to update_rating but removal would mean changing code in views
    if self.ratings.exists?
      ratings = Rating.all.where(post_id: self.id)
      # access these with like @post.current_rating[:co2]
      rating_co2 = ratings.sum("co2") / ratings.count.to_f
      rating_waste = ratings.sum("waste") / ratings.count.to_f
      rating_resources = ratings.sum("resources") / ratings.count.to_f
      rating_diyeffort = ratings.sum("diyeffort") / ratings.count.to_f
      rating_ecocost = ratings.sum("ecocost") / ratings.count.to_f
      rating_avg = ratings.sum("avg") / ratings.count.to_f
      { co2: rating_co2, waste: rating_waste, resources: rating_resources,
       diyeffort: rating_diyeffort, ecocost: rating_ecocost, avg: rating_avg }
    else
      { co2: 0, waste: 0, resources: 0, diyeffort: 0, ecocost: 0, avg: 0 }
    end
  end

  def update_rating
      ratings = Rating.all.where(post_id: self.id)
      # access these with like @post.current_rating[:co2]
      co2 = ratings.sum("co2") / ratings.count.to_f
      waste = ratings.sum("waste") / ratings.count.to_f
      resources = ratings.sum("resources") / ratings.count.to_f
      diyeffort = ratings.sum("diyeffort") / ratings.count.to_f
      ecocost = ratings.sum("ecocost") / ratings.count.to_f
      avg = ratings.sum("avg") / ratings.count.to_f
      self.update(rating_co2: co2, rating_waste: waste, rating_resources: resources,
                  rating_diyeffort: diyeffort, rating_ecocost: ecocost, rating_avg: avg)
  end

end
