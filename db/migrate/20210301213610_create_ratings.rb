class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :rating_avg
      t.float :rating_co2
      t.float :rating_waste
      t.float :rating_resources
      t.float :rating_diyeffort
      t.float :rating_ecocost
    end
  end
end
