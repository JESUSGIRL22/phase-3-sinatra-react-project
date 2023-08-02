require 'sinatra'
require 'json'
require './models/product'
require './models/category'
require './models/cart_item'  # Assuming you have a CartItem model

# Enable CORS for development
configure do
  set :allow_origin, :any
end

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end

# Products

get '/products' do
  products = Product.all
  products.to_json
end

get '/products/:id' do
  product = Product.find(params[:id])
  product.to_json
end

post '/products' do
  product = Product.new(JSON.parse(request.body.read))
  if product.save
    status 201
  else
    status 400
  end
end

put '/products/:id' do
  product = Product.find(params[:id])
  if product.update_attributes(JSON.parse(request.body.read))
    status 204
  else
    status 400
  end
end

delete '/products/:id' do
  product = Product.find(params[:id])
  if product.destroy
    status 204
  else
    status 400
  end
end

# Categories

get '/categories' do
  categories = Category.all
  categories.to_json
end

get '/categories/:id' do
  category = Category.find(params[:id])
  category.to_json
end

# Cart Items

get '/cart' do
  cart_items = CartItem.all
  cart_items.to_json
end

get '/cart/:id' do
  cart_item = CartItem.find(params[:id])
  cart_item.to_json
end

post '/cart' do
  cart_item = CartItem.new(JSON.parse(request.body.read))
  if cart_item.save
    status 201
  else
    status 400
  end
end

put '/cart/:id' do
  cart_item = CartItem.find(params[:id])
  if cart_item.update_attributes(JSON.parse(request.body.read))
    status 204
  else
    status 400
  end
end

delete '/cart/:id' do
  cart_item = CartItem.find(params[:id])
  if cart_item.destroy
    status 204
  else
    status 400
  end
end
