# require 'json'
# require 'open-uri'

# url = '/list.php?i=listhttps://www.thecocktaildb.com/api/json/v1/1'
# ingredients_serialized = open(url).read
# ingredients = JSON.parse(ingredients_serialized)

# ingredients.each do |ingredient|
#   Ingredient.create!(business.slice(:strIngredient1))
# end


# filepath = '/list.php?i=listhttps://www.thecocktaildb.com/api/json/v1/1'

# serialized_beers = File.read(filepath)

# beers = JSON.parse(serialized_beers)
puts 'Cleaning database...'
Ingredient.destroy_all

puts 'creating ingredients...'
10.times do
  new_ing = Ingredient.new(
    name: Faker::Science.element
    )
  new_ing.save
end

puts "Created #{Ingredient.count} ingredients!"
