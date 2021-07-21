require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "food_order")

results = client.query("SELECT * FROM orders")

results.each do |row|
    puts row
end

