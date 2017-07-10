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
t2 = Team.create!(name: 'another team')

puts 'Creating user...'
u1 = User.create!(email: 'a@b.com', password: '123123', team: t, first_name: 'Hide', last_name: 'Nagaoka')
u2 = User.create!(email: 'a@c.com', password: '123123', team: t, first_name: 'Dim', last_name: 'Bosch')
u3 = User.create!(email: 'a@d.com', password: '123123', team: t2, first_name: 'Paul', last_name: 'Gaumer')

puts 'Creating requests...'
r1 = Request.create!(content: 'Buying new PC', user: u1, duedate: Time.zone.now + 5.days)
r2 = Request.create!(content: 'Buying new chairs', user: u1, duedate: Time.zone.now + 10.days)
r3 = Request.create!(content: 'Cealing company stamp', user: u2, duedate: Time.zone.now + 5.days)
r4 = Request.create!(content: 'Finishing contract of the new office', user: u2, duedate: Time.zone.now + 10.days)
Request.create!(content: 'Request of Another team', user: u3, duedate: Time.zone.now + 10.days)
Request.create!(content: 'Request of same team but not relevant', user: u2, duedate: Time.zone.now + 10.days)

puts 'Creating receivers...'
rc1 = Receiver.create!(user: u2, request: r1)
Receiver.create!(user: u2, request: r2)
Receiver.create!(user: u1, request: r3)
Receiver.create!(user: u1, request: r4)

puts 'Creating comments...'
Comment.create!(content: 'Greato job!', request: r1, author: rc1)
Comment.create!(content: 'Thank you!', request: r1, author: u1)

puts 'Finished!'
