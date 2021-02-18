
puts 'Cleaning database...'
Cocktail.destroy_all

puts 'creating cocktails...'
10.times do
  new_cocktail = Cocktail.new(
    name: Faker::Science.element
    )
  new_cocktail.save
end

puts "Created #{Cocktail.count} cocktails!"

require 'json'
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all
puts 'creating ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredients = JSON.parse(ingredient_serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts "Created #{Ingredient.count} ingredients!"
