require_relative '../db/db_connection.rb'
require_relative 'category.rb'

class Item

    
    attr_accessor :id, :name, :price, :categories

    def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @price = params[:price]
        @categories = []
    end

    def save
        return false unless valid?
        client = create_db_client
        client.query("INSERT INTO items (name, price) VALUES ('#{name}', #{price})")
    end

    def valid?
        return false if name.nil? || price.nil?

        true
    end
end