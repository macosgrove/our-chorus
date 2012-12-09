# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless User.find_for_database_authentication(login: 'maryannecos@gmail.com')
  founder = User.create!(username: 'macosgrove', password: 'ourchorusfounder', email: 'maryannecos@gmail.com')
  founder.add_role :founder
end
