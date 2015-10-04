# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
b1 = Beer.create!(beer_style: 'ipa', description: "sdlkafjlsdfjladsjfl askldjflasdj flasjdf adklsjf ladksjf ladskj flafj dslakfj lsdajf")
BeerType.create!(appearance: 'sdkfjdlsafsadf', smell: 'sdakfjslkdjf', taste: 'slkfjdlsakf', overall: '4/5', beer_id: b1.id)