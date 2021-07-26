require "./db/db_connector"
require_relative "./item"

class Category
    attr_reader :id, :name, :items

    @client = create_db_client

    def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @items = []
    end

    def self.show_categories
        result = @client.query("SELECT * FROM categories")
        convert_rawdata(result)
    end

    def self.convert_rawdata(result)
        categories = []
        result.each do |data|
            category = Category.new(
                id: data["id"],
                name: data["name"]
            )
        categories.push(category)
        end
        categories
    end

    def self.show_category(id)
        result = @client.query("SELECT * FROM categories WHERE id = #{id}").first
        category = Category.new(result["id"], result["name"])
    end

    def self.categoryItems(category_id)
        items = []
        @client.query("SELECT * FROM items WHERE id IN 
        (SELECT item_id FROM item_categories WHERE category_id = #{category_id})"
        ).each do |result|
            item = Item.new(result["id"], result["name"], result["price"])
            items.push(item)
        end
        items
    end

    def self.add(name)
        return false unless valid?

        @client.query("INSERT INTO categories(name) VALUES ('#{name}')")
    end

    def self.edit(params)
        @client.query("UPDATE categories SET name = '#{params[:name]}' WHERE id = #{params[:id]}")
    end

    def self.delete(id)
        @client.query("DELETE FROM item_categories WHERE category_id = #{id}")
        @client.query("DELETE FROM categories WHERE id = #{id}")
    end

    def valid?
        return false if @name.nil?
        true
    end
end