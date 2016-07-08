# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "admin", user_type: 2, email: "project_manager@gmail.com", password: "password", password_confirmation: "password")
["Hire Influence", "Velocity", "Inspect Date", "Senseihub"].each do |project_name|
	Project.create(name: project_name)
end
["Hiren", "Ajay", "Hardik", "Bhavi"].each do |username|
    User.create(email: "#{username.downcase}@gmail.com", password: "password", password_confirmation: "password", username: username)
end