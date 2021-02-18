
# puts 'Cleaning database...'
# Ingredient.destroy_all

# puts 'creating ingredients...'
# 10.times do
#   new_ing = Ingredient.new(
#     name: Faker::Science.element
#     )
#   new_ing.save
# end

# puts "Created #{Ingredient.count} ingredients!"

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
