# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
user.update_attributes(admin: true)
puts 'CREATED ADMIN USER: ' << user.email

if Rails.env.development?
  # Users
  99.times do |n|
    name     = Faker::Name.name
    email    = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create(name: name,
                email: email,
                password: password,
                password_confirmation: password,
                confirmed_at: Time.zone.now)
  end

  # Short Urls
  users = User.order(:created_at).take(6)
  50.times do
    title = Faker::Lorem.sentence(5)
    url   = Faker::Internet.url
    users.each { |user| user.short_urls.create(title: title, url: url) }
  end
end
