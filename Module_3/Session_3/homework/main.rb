require "sinatra"
require_relative "./controllers/item_controller"
require_relative "./controllers/category_controller"

#Item Route
get '/items' do
    ItemController.list_item
end


get '/items/:id' do
    ItemController.item_details
end

get '/items/new' do
    ItemController.item_categories
end

get '/items/:id/edit'
    ItemController.item_edit
end

post '/items' do 
    ItemController.create(params)
    redirect '/'
end

put '/items/:id' do
    ItemController.edit(params)
    redirect '/'
end

delete '/items/:id' do
    ItemController.delete(params[:id])
    redirect '/'
end



#Category Route
get '/categories' do
    CategoryController.show_categories
end

get '/categories/:id/edit' do
    CategoryController.show_category(params[:id])
end

post '/categories' do
    CategoryController.create(params[:name])
end


put '/categories/:id' do
    CategoryController.update(params)
    redirect '/'
end

delete '/categories/:id' do
    CategoryController.delete(params[:id])
    redirect '/'
end