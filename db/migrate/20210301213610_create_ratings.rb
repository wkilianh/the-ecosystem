class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :avg
      t.float :co2
      t.float :waste
      t.float :resources
      t.float :diyeffort
      t.float :ecocost
      t.timestamps
    end
  end
end
