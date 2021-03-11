class AddRatingsToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :rating_co2, :float, default: 0
    add_column :posts, :rating_waste, :float, default: 0
    add_column :posts, :rating_resources, :float, default: 0
    add_column :posts, :rating_diyeffort, :float, default: 0
    add_column :posts, :rating_ecocost, :float, default: 0
  end
end
