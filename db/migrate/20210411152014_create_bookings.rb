class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :renter_id
      t.integer :freelance_id

      t.timestamps
      t.belongs_to :job, foreign_key: true
    end
  end
end
