class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :quantity

      t.timestamps
      t.belongs_to :user, foreign_key: true
      t.belongs_to :category, foreign_key: true
    end
  end
end
