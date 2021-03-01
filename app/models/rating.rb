class Rating < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :rating_avg, :rating_co2, :rating_waste,
            :rating_resources, :rating_diyeffort, :rating_ecocost, presence: true
  validates :post_id, uniqueness: { scope: :user_id, message: "You cannot vote twice!" }
end
