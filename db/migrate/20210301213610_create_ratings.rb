class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :avg, default: 0
      t.float :co2, default: 0
      t.float :waste, default: 0
      t.float :resources, default: 0
      t.float :diyeffort, default: 0
      t.float :ecocost, default: 0
      t.timestamps
    end
  end
end
