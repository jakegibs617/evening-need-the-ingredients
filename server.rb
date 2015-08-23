require 'pry'
require 'sinatra'
require 'pry'
require 'shotgun'

get '/' do
  @ingredients = File.readlines('ingredients.txt')
  @instructions = File.readlines('instructions.txt')

  erb :index
end


post '/ingredients' do
  ingredient = (params['ingredient'])
  File.open('ingredients.txt', 'a') do |file|
    file.puts(ingredient)
  end

  redirect '/'
end
# curl -d ingredient="jakegibs" http://localhost:4567/ingredients

# system ('curl -d ingredient="3 tablespoons good olive oil
# 3/4 teaspoon kosher salt
# 1/2 teaspoon freshly ground black pepper" http://localhost:4567/ingredients')
