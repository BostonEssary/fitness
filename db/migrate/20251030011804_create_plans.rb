class CreatePlans < ActiveRecord::Migration[8.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :days

      t.timestamps
    end
  end
end
