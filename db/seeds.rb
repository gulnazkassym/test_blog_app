# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def create_posts
  puts 'Creating posts...'
  [
    {
      title: Faker::Lorem.word.capitalize,
      subtitle: Faker::Lorem.sentence,
      text: Faker::Lorem.paragraph,
      is_published: true,
      user: User.all.first,
      read_by: []
    },
    {
      title: Faker::Lorem.word.capitalize,
      subtitle: Faker::Lorem.sentence,
      text: Faker::Lorem.paragraph,
      is_published: false,
      user: User.all.last,
      read_by: []
    }
  ].each do |post|
    puts "\t#{post[:title]}"
    Post.create!(post)
  end
end

def create_users
  puts 'Creating users...'
  [
    {
      username: 'user@user.com',
      password: 'qwerty123',
      fullname: 'Userov User Userovich'
    },
    {
      username: 'test@test.com',
      password: 'qwerty123',
      fullname: 'Testov Test Testovich'
    }
  ].each do |user|
    puts "\t#{user[:username]}"
    User.create!(user)
  end
end

create_users
create_posts
