require_relative '../db/db_connection.rb'

class Category
    def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @items = []
    end

    def save
        return false unless valid?
        
        client = create_db_client
        client.query("INSERT INTO categories (name) VALUES ('#{@name}')")

        true
    end

    def valid?
        return false if @name.nil?

        true
    end
    
end