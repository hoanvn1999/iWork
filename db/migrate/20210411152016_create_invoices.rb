class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.integer :quantity
      t.float :current_price

      t.timestamps
      t.belongs_to :product, foreign_key: true
    end
  end
end
