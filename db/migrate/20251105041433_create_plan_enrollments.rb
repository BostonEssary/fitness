class CreatePlanEnrollments < ActiveRecord::Migration[8.1]
  def change
    create_table :plan_enrollments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.integer :status, default: 0
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
