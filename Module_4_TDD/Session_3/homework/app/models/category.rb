require_relative '../db/db_connection.rb'

class Category
    def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @items = []
    end
end