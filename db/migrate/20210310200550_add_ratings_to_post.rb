class AddRatingsToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :rating_co2, :float
    add_column :posts, :rating_waste, :float
    add_column :posts, :rating_resources, :float
    add_column :posts, :rating_diyeffort, :float
    add_column :posts, :rating_ecocost, :float
  end
end
