require 'erb'
require_relative '../models/category'

class CategoryController

    def show_categories
        categories = Category.show_categories
        renderer = ERB.new(File.read("./views/categories/category_index.erb"))
        renderer.result(binding)
    end

    def category_items
        category_item = Category.categoryItems(params[:id])
        renderer = ERB.new(File.read("./views/categories/category_items.erb"))
        renderer.result(binding)
    end

    def category_add
        Category.add(params[:name])
    end

    def category_details
        category = Category.show_category(params[:id])
    end

    def category_edit
        Category.edit(params)
    end

    def category_delete
        Category.delete(params[:id])
    end










end
