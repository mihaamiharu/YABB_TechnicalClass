require "./db/db_connector"
require_relative "./category"

class Item
    attr_reader :id, :name, :price, :categories

    @client = create_db_client

    
    def initialize(id, name, price, categories=[])
        @id = id
        @name = name
        @price = price
        @categories = categories
    end

    def to_s
       # "#{@id} #{@name} #{price} #{categories}" 
    end
    
    def self.all
        client = create_db_client
        items = []
        rawData = client.query("select * from items")
    
        rawData.each do |data|
            item  = Item.new(data["name"], data["price"], data["id"]);
            items.push(item)
        end
    
        items
    end

  

    def self.show_item(id)
        itemData = @client.query("SELECT * FROM items WHERE id = #{id}").first
        categories = []
        @client.query("SELECT * FROM categories WHERE id IN
        (SELECT category_id FROM item_categories WHERE item_id = #{id})"
        ).each do |categoryData|
            category = Category.new(categoryData["id"], categoryData["name"])
            categories.push(category)
        end
        item = Item.new(itemData["id"], itemData["name"], itemData["price"], categories)
    end

    def self.add(params)
        return false unless valid?

        
        @client.query("INSERT INTO items(name,price) VALUES ('#{params[:name]}', #{params[:price]})")
        item_id = @client.last_id
        params[:category_ids].each do |category_id|
            @client.query("INSERT INTO item_categories(item_id, category_id) VALUES(#{item_id}, #{category_id}")
        end
    end

    def self.edit(params)
        @client.query("begin")
        begin
        @client.query("UPDATE items SET name = '#{params[:name]}', price = #{params[:price]} WHERE id = #{params[:id]}")
        @client.query("DELETE FROM item_categories WHERE item_id =#{params[:id]}")
        params[:category_ids].each do |category_id|
            @client.query("INSERT INTO item_categories VALUES(#{params[:id]}, #{category_id})")
        end
        rescue Exception => e
        client.query("rollback")
        end
        client.query("commit")
    end

    def self.delete(id)
        @client.query("DELETE FROM item_categories WHERE item_id = #{id}")
        @client.query("DELETE FROM items WHERE id = #{id}")
    end

    def valid?
        return false if @name.nil?
        return false if @price.nil?
        true
    end


end

