class Rating < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :avg, :co2, :waste,
            :resources, :diyeffort, :ecocost, presence: true
  validates :post_id, uniqueness: { scope: :user_id, message: "You cannot vote twice!" }

  def calc_avg
    (co2.to_i + waste.to_i + resources.to_i + ecocost.to_i) / 5.0
  end

end
