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
User.destroy_all
Exercise.destroy_all
Plan.destroy_all
Entry.destroy_all
PlanEnrollment.destroy_all

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

# create plans with names that match muscle groups and varying day counts
plans_data = [
  { name: "Chest", days: 3 },
  { name: "Back", days: 4 },
  { name: "Shoulders", days: 5 },
  { name: "Legs", days: 6 },
  { name: "Core", days: 4 },
  { name: "Full Body", days: 5 },
]

puts "Creating plans..."
plans_data.each do |plan_data|
  Plan.find_or_create_by!(plan_data)
end

# create entries for each plan across all their days
puts "Creating entries..."
Plan.all.each do |plan|
  entries = []
  
  # Create entries for each day of the plan
  (1..plan.days).each do |day_number|
    # Randomly assign 2-4 exercises per day for variety
    exercises_per_day = rand(2..4)
    
    exercises_per_day.times do |i|
      entries << {
        exercise: Exercise.all.sample,
        plan: plan,
        reps: rand(10..20),
        sets: rand(3..5),
        order: i + 1,
        day: day_number
      }
    end
  end
  
  entries.each do |entry|
    Entry.find_or_create_by!(entry)
  end
end

# create default users
puts "Creating users..."
users_data = [
  { email_address: "john@example.com", password: "password123" },
  { email_address: "jane@example.com", password: "password123" },
  { email_address: "mike@example.com", password: "password123" },
  { email_address: "sarah@example.com", password: "password123" },
  { email_address: "demo@example.com", password: "password" },
]

users = []
users_data.each do |user_data|
  users << User.create!(user_data)
end

# enroll users into plans
puts "Enrolling users into plans..."
plans = Plan.all.to_a

users.each_with_index do |user, index|
  # Assign each user to a different plan (cycling through available plans)
  plan = plans[index % plans.length]
  PlanEnrollment.create!(
    user: user,
    plan: plan,
    status: :active
  )
  puts "  Enrolled #{user.email_address} into #{plan.name} plan (#{plan.days} days)"
end

puts "\nSeed data created successfully!"
puts "Users created: #{User.count}"
puts "Plans created: #{Plan.count}"
puts "Entries created: #{Entry.count}"
puts "Plan enrollments created: #{PlanEnrollment.count}"