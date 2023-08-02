# controllers/products_controller.rb

# ... (previous code)

# POST /products
post '/products' do
  product = Product.create(params)
  product.to_json
end

# PUT /products/:id
put '/products/:id' do
  product = Product.find(params[:id])
  product.update(params)
  product.to_json
end

# DELETE /products/:id
delete '/products/:id' do
  product = Product.find(params[:id])
  product.destroy
  status 204
end
