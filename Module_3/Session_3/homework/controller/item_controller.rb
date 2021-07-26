require 'erb'
require_relative '../models/item.rb'
require_relative '../models/category.rb'

class ItemController

    def self.list_item
        items = Item.all
        render = ERB.new(File.read("./views/items/item_index.erb"))
        render.result(binding)
    end

    def self.show_categories
        categories = Category.show_categories
        renderer = ERB.new(File.read("./views/categories/category_index.erb"))
        renderer.result(binding)
    end


    def self.item_details
        item = Item.show_item(params[:id])
        renderer = ERB.new(File.read("./views/items/item_show"))
        renderer.result(binding)
    end
    
    def self.item_add
        Item.add(params)
        renderer = ERB.new(File.read("./views/items/item_create"))
        renderer.result(binding)
    end

    def edit_view
        Item.edit(params)
        renderer = ERB.new(File.read("./views/items/item_edit"))
        renderer.result(binding)
    end

    def item_edit
        item = Item.show_item(params[:id])
        categories = Category.show_categories
        item_category = item.categories.map(&:id)
    end

    

    def item_delete
        item.delete(params[:id])
    end


end