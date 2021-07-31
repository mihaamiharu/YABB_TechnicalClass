require './db/db_connection'
require './models/categories'

class Items
    attr_accessor :id, :name, :price, :categories

    def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @price = params[:price]
        @categories = []
    end
end