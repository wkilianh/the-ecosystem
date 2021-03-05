class Rating < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :avg, :co2, :waste,
            :resources, :diyeffort, :ecocost, presence: true
  validates :post_id, uniqueness: { scope: :user_id, message: "You cannot vote twice!" }
end
