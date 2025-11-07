# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_11_06_204743) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "completed_sets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "entry_id", null: false
    t.integer "reps"
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.bigint "workout_id", null: false
    t.index ["entry_id"], name: "index_completed_sets_on_entry_id"
    t.index ["workout_id"], name: "index_completed_sets_on_workout_id"
  end

  create_table "entries", force: :cascade do |t|
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.integer "day"
    t.bigint "exercise_id", null: false
    t.integer "order"
    t.bigint "plan_id", null: false
    t.integer "reps"
    t.integer "sets"
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_entries_on_exercise_id"
    t.index ["plan_id"], name: "index_entries_on_plan_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "plan_enrollments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.bigint "plan_id", null: false
    t.date "start_date"
    t.integer "status", default: 0
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["plan_id"], name: "index_plan_enrollments_on_plan_id"
    t.index ["user_id"], name: "index_plan_enrollments_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "days"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.integer "day"
    t.bigint "plan_enrollment_id", null: false
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["plan_enrollment_id"], name: "index_workouts_on_plan_enrollment_id"
  end

  add_foreign_key "completed_sets", "entries"
  add_foreign_key "completed_sets", "workouts"
  add_foreign_key "entries", "exercises"
  add_foreign_key "entries", "plans"
  add_foreign_key "plan_enrollments", "plans"
  add_foreign_key "plan_enrollments", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "workouts", "plan_enrollments"
end
