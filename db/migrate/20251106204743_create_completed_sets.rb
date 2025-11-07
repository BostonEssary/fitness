class CreateCompletedSets < ActiveRecord::Migration[8.1]
  def change
    create_table :completed_sets do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :entry, null: false, foreign_key: true
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
