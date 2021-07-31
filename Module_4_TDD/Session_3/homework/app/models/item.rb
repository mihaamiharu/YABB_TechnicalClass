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
        return false if @name.nil? || @price.nil? #i dont return id because it's already auto increment

        true
    end

    def self.show_items
        client = create_db_client
        sql = client.query("SELECT * FROM items")
        sql_parser(sql)
    end

    def self.show_itemCategory(params)
        client = create_db_client
        sql = client.query("SELECT items.id, items.name, items.price, categories.name FROM items JOIN item_categories ON items.id = item_categories,item_id JOIN categories ON item_categories.category_id = categories.id WHERE items.id = #{params} LIMIT 1" )
        sql_parser(sql)
    end

    def self.sql_parser(params)
        items = []
        params.each do |data|
            item = Item.new(data.transform_keys(&:to_sym))  #hash transform key
            items << item
        end
        items 
    end





    
end