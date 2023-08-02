class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Get a list of all makeup products
get '/products' do
  @products = Product.all
  erb :'products/index'
end


  # Existing route
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # Example route for a list of makeup products
  get '/products' do
    @products = Product.all
    erb :'products/index'
  end

  # Example route for a single makeup product
  get '/products/:id' do
    @product = Product.find(params[:id])
    erb :'products/show'
  end

  # Example route for adding a product to the cart
  post '/cart/:product_id' do
    # Implement your logic to add the product to the cart
    redirect '/cart'
  end

  # Example route for updating a product in the cart
  patch '/cart/:product_id' do
    # Implement your logic to update the product in the cart
    redirect '/cart'
  end

  # Example route for deleting a product from the cart
  delete '/cart/:product_id' do
    # Implement your logic to delete the product from the cart
    redirect '/cart'
  end

  # Add more routes specific to your project as needed

end
