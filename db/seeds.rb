# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Auto create 20 users"

create_account = for i in 1..20 do
    User.create([email: "example#{i}@test.com", password: '12345678', password_confirmation: '12345678', name: "測試用帳號-#{i}"])

  end
