require "sinatra"
require_relative "db_connector"


get "/" do
    items = display_items
    erb :'items/item_index', locals: {
        items: items
    }
end

get "/items/new" do
    categories = display_categories
    erb :'items/item_create', locals: {
        categories: categories
    }
end

get "/items/:id/show" do
    item = display_item(params[:id])
    erb :'items/item_show', locals: {
        item: item
    }
end

get "/items/:id/edit" do
    item = get_item(params[:id])
    categories = get_categories
    erb :'items/item_edit', locals: {
        item: item,
        categories: categories
    }
end

post "/items/create" do
    create_item(
        params[:name],
        params[:price],
        params[:category_id]
    )
    redirect "/"
end

put "/items/:id/update" do
    update_item(
        params[:id],
        params[:name],
        params[:price],
        params[:category_id]
    )
    redirect "/"
end

delete "/items/:id/destroy" do
    delete_item(params[:id])
    redirect "/"
end

get "/items/back" do 
    redirect "/"
end