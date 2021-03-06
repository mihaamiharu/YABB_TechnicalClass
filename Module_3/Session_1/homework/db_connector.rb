require "mysql2"
require "./models/category"
require "./models/item"

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "",
        :database => "food_oms_db"
    )
end

def display_items
    client = create_db_client
    raw = client.query(
        "SELECT items.id, items.name, items.price, categories.id AS category_id, categories.name AS category_name
        FROM items
        JOIN item_categories
        ON items.id = item_categories.item_id
        JOIN categories
        ON item_categories.category_id = categories.id
        ORDER BY items.id ASC"
    )
    items = []
    raw.each do |data|
        category = Category.new(data["category_id"], data["category_name"])
        item = Item.new(data["id"], data["name"], data["price"], category)
        items << item
    end
    items
end

def display_categories
    client = create_db_client
    raw = client.query("SELECT * FROM categories ORDER BY name ASC")
    categories = []
    raw.each do |data|
        category = Category.new(data["id"], data["name"])
        categories << category
    end
    categories
end

def display_item(id)
    client = create_db_client
    item_data = client.query("SELECT id, name, price FROM items WHERE id = #{id}").first
    item_category_data = client.query("SELECT category_id FROM item_categories WHERE item_id = #{id}").first
    category_data = client.query("SELECT id, name FROM categories WHERE id = #{item_category_data["category_id"]}").first
    category = Category.new(category_data["id"], category_data["name"])
    item = Item.new(item_data["id"], item_data["name"], item_data["price"], category)
end

def create_item(name, price, category_id)
    client = create_db_client
    client.query("begin")
    begin
    item_insert = "INSERT INTO items(name, price) VALUES('#{name}', #{price})"
    client.query(item_insert)
    itemCategories_insert = "INSERT INTO item_categories(item_id, category_id) VALUES(#{client.last_id}, #{category_id})"
    client.query(itemCategories_insert)
    rescue Exception => e
    puts e #Print SQL Error
    client.query("rollback")
    end
    client.query("commit")
    client.close
end

def update_item(id, name, price, category_id)
    client = create_db_client
    client.query("begin")
    begin
    client.query("UPDATE items SET name = '#{name}', price = #{price} WHERE id = #{id}")
    client.query("UPDATE item_categories SET category_id = #{category_id} WHERE item_id = #{id}")
    rescue Exception => e
    puts e 
    client.query("rollback")
    end

    client.query("commit")
    client.close
end

def delete_item(id)
    client = create_db_client
    client.query("begin")
    begin
    client.query("DELETE FROM item_categories WHERE item_id = #{id}")
    client.query("DELETE FROM items WHERE id = #{id}")
    rescue Exception => e
        puts e
        client.query("rollback")
    end

    client.query("rollback")
    client.close
end