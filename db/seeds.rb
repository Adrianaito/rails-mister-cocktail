require "open-uri"
puts 'Cleaning database...'
Cocktail.destroy_all

puts 'creating cocktails...'
url = ['https://cutt.ly/Elq5W4B', 'https://cutt.ly/mlq5OZv', 'https://cutt.ly/xlq5Z3T']
12.times do
  new_cocktail = Cocktail.create!(
    name: Faker::Science.element
  )


  file = URI.open(url.sample)
  new_cocktail.photo.attach(io: file, filename: 'nes.jpeg', content_type: 'image/jpeg')
  new_cocktail.save
end

puts "Created #{Cocktail.count} cocktails!"

puts 'Cleaning database...'
Ingredient.destroy_all
puts 'creating ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredients = JSON.parse(ingredient_serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

puts "Created #{Ingredient.count} ingredients!"
