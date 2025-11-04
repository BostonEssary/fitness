# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#clear all existing data
puts "Clearing existing data..."
Exercise.destroy_all
Plan.destroy_all
Entry.destroy_all

exercises = [
  { name: "Push-ups" },
  { name: "Pull-ups" },
  { name: "Squats" },
  { name: "Lunges" },
  { name: "Planks" },
  { name: "Crunches" },
  { name: "Leg Raises" },
  { name: "Mountain Climbers" },
]

puts "Creating exercises..."
exercises.each do |exercise|
  Exercise.find_or_create_by!(exercise)
end

# create 5 plans with names that match muscle groups
muscle_groups = [
  "Chest",
  "Back",
  "Shoulders",
  "Legs",
  "Core",
]

puts "Creating plans..."
muscle_groups.each do |muscle_group|
  Plan.find_or_create_by!(name: muscle_group, days: 7)
end

# create 10 entries for each plan
puts "Creating entries..."
Plan.all.each do |plan|
  entries = [
    { exercise: Exercise.all.sample, plan: plan, reps: rand(10..20), sets: rand(3..5), order: 1, day: 1 },
    { exercise: Exercise.all.sample, plan: plan, reps: rand(10..20), sets: rand(3..5), order: 2, day: 1 },
    { exercise: Exercise.all.sample, plan: plan, reps: rand(10..20), sets: rand(3..5), order: 3, day: 1 },
    { exercise: Exercise.all.sample, plan: plan, reps: rand(10..20), sets: rand(3..5), order: 4, day: 1 },
    { exercise: Exercise.all.sample, plan: plan, reps: rand(10..20), sets: rand(3..5), order: 5, day: 1 },
    { exercise: Exercise.all.sample, plan: plan, reps: rand(10..20), sets: rand(3..5), order: 6, day: 1 },
    { exercise: Exercise.all.sample, plan: plan, reps: rand(10..20), sets: rand(3..5), order: 7, day: 1 },
    { exercise: Exercise.all.sample, plan: plan, reps: rand(10..20), sets: rand(3..5), order: 8, day: 1 },
    { exercise: Exercise.all.sample, plan: plan, reps: rand(10..20), sets: rand(3..5), order: 9, day: 1 },
  ]
  entries.each do |entry|
    Entry.find_or_create_by!(entry)
  end
end