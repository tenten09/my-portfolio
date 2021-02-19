# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

green = User.create!(account: 'Green', email: 'green@example.com', password: 'password')
emily = User.create!(account: 'Emily', email: 'emily@example.com', password: 'password')

5.times do
  green.posts.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 30)
  )
  end

  5.times do
    emily.posts.create!(
      title: Faker::Lorem.sentence(word_count: 5),
      content: Faker::Lorem.sentence(word_count: 30)
    )
    end