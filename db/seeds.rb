# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless User.find_for_database_authentication(login: 'maryannecos@gmail.com')
  founder = User.create!(username: 'macosgrove', password: 'ourchorusfounder', email: 'maryannecos@gmail.com', first_name: 'Mary-Anne', last_name: 'Cosgrove', mobile: '0408 945 360')
  founder.add_role :founder
end
unless User.find_for_database_authentication(login: 'ourchorus.info@gmail.com')
  developer = User.create!(username: 'dev', password: 'developer01', email: 'ourchorus.info@gmail.com', first_name: 'Website', last_name: 'Developer')
  developer.add_role :developer
end
