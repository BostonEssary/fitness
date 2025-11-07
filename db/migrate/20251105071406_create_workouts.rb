class CreateWorkouts < ActiveRecord::Migration[8.1]
  def change
    create_table :workouts do |t|
      t.references :plan_enrollment, null: false, foreign_key: true
      t.integer :day
      t.integer :status
      t.datetime :completed_at

      t.timestamps
    end
  end
end
