# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Comment.destroy_all
Receiver.destroy_all
Request.destroy_all
User.destroy_all
Team.destroy_all

puts 'Creating team...'
t = Team.create!(name: 'test team')

puts 'Creating user...'
u1 = User.create!(email: 'a@b.com', password: '123123', team: t, first_name: 'Hide', last_name: 'Nagaoka')
u2 = User.create!(email: 'a@c.com', password: '123123', team: t, first_name: 'Dim', last_name: 'Bosch')

puts 'Creating requests...'
r1 = Request.create!(content: 'Buying new PC', user: u1, duedate: Time.zone.now + 5.days)
r2 = Request.create!(content: 'Cealing company stamp', user: u2, duedate: Time.zone.now + 5.days)

puts 'Creating receivers...'
rc1 = Receiver.create!(user: u2, request: r1)
rc2 = Receiver.create!(user: u1, request: r2)

puts 'Creating comments...'
Comment.create!(content: 'Greato job!', request: r1, author: rc1)
Comment.create!(content: 'Thank you!', request: r1, author: u1)

puts 'Finished!'
