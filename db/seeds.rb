# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

test_users = %w( Mike Raju Samantha Henry Krishna Sam Bill Munir Rose )

test_users.each do |name|
  user = User.new(name: name)
  user.save!
end
