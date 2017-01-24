# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# json = ActiveSupport::JSON.decode(File.open('https://api.imgflip.com/get_memes'))
require 'pry'
require 'json'
require 'open-uri'
json = JSON.parse(open("https://api.imgflip.com/get_memes").read)
json = json["data"]["memes"]

json.each do |meme|
  Category.create!(name: meme['name'], image_url: meme['url'])
end
