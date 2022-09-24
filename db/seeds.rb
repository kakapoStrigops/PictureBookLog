# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by(email: ENV['ADMIN_EMAIL']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end

(0..100).each do |n|
  Member.find_or_create_by(email: "test10#{n}@example.com") do |member|
    member.password = "123456"
    member.name = "test#{n}"
    member.name_kana = "test#{n}"
    member.nickname = "nickname#{n}"
    member.year_of_birth = 1990
  end
end