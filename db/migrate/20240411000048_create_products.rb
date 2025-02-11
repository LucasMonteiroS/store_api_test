class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :description
      t.decimal :price
      t.string :name
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
