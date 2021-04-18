class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.float :salary
      t.datetime :date
      t.integer :number_of_staffs
      t.text :description

      t.timestamps
      t.belongs_to :user, foreign_key: true
    end
  end
end
