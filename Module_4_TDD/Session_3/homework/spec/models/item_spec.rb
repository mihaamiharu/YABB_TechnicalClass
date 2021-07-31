require_relative '../../app/models/item'
require_relative '../../app/db/db_connection'

describe Item do
    describe '#valid?' do
    context 'when given valid input' do
      it 'should return true if valid' do
        item = Item.new({
          id: 1,
          name: 'Jellopy',
          price: 15000
        })

        expect(item.valid?).to eq(true)
      end
    end

    context 'when given invalid input' do
      it 'should return false when name is nil' do
        item = Item.new({
          id: 1,
          price: 15000
        })

        expect(item.valid?).to be_falsey #be falsey means false
      end

      it 'should return false when price is nil' do
        item = Item.new({
          id: 1,
          name: 'Jellopy'
        })

        expect(item.valid?).to be_falsey #be falsey means false
      end
    end

    describe '#select' do
      context 'when result is found' do
        it 'should return all items' do
          item = Item.new({
            id: nil,
            name: nil,
            price: nil
          })

          sql = "SELECT * FROM items"

          expected_result = [{
            "id" => item.id,
            "name" => item.name,
            "price" => item.price
          }]

          mock_db = double
          allow(Mysql2::Client).to receive(:new).and_return(mock_db)
          expect(mock_db).to receive(:query).with(sql).and_return(expected_result)

          Item::show_items
        end
      end
      it 'should return item with selected id' do
        item = Item.new({
          id: 1,
          name: nil,
          price: nil
        })

        sql = "SELECT items.id, items.name, items.price, categories.name FROM items JOIN item_categories ON items.id = item_categories,item_id JOIN categories ON item_categories.category_id = categories.id WHERE items.id = #{item.id} LIMIT 1"

        expected_result = [{
          "id" => item.id,
          "name" => item.name,
          "price" => item.price
        }]

        mock_db = double
        allow(Mysql2::Client).to receive(:new).and_return(mock_db)
        expect(mock_db).to receive(:query).with(sql).and_return(expected_result)

        Item::show_itemCategory(1)
      end

      context 'when result is not found' do
        it 'should return nil' do
        
          sql = "SELECT * FROM items"

          mock_db = double
          allow(Mysql2::Client).to receive(:new).and_return(mock_db)
          expect(mock_db).to receive(:query).with(sql)
          Item::show_items
        end

        it 'should return nil if id is nil' do

          id = 1
          sql = "SELECT * FROM items WHERE id = '#{id}'"
          mock_db = double
          allow(Mysql2::Client).to receive(:new).and_return(mock_db)
          expect(mock_db).to receive(:query).with(sql).and_return(nil)

          
          expect(nil). to eq(Item::show_item(id))
        end
      end
  end

    describe '#save' do
      context 'when insert an item' do
        it 'should return new item value' do
          item = Item.new({
            id: nil,
            name: 'Jellopy',
            price: 15000
          })

          sql = "INSERT INTO items (name, price) VALUES ('#{item.name}', #{item.price})"
          mock_db = double
          allow(Mysql2::Client).to receive(:new).and_return(mock_db)
          expect(mock_db).to receive(:query).with(sql)

          item::save
        end
      end
    end

    describe '#update' do
      context 'when edit an item' do
        it 'should return the old value to the new value' do
          item = Item.new({
            id: 1,
            name: 'Jellopy',
            price: 15000
          })

          sql = "UPDATE items, item_categories SET items.name = '#{item.name}', items.price = #{item.price}, item_categories.category_id = #{1} WHERE items.id = #{item.id} AND item_categories.item_id = #{item.id}"
          mock_db = double
          allow(Mysql2::Client).to receive(:new).and_return(mock_db)
          expect(mock_db).to receive(:query).with(sql)

          item::update_item(1)
       end
      end
    end

    describe '#delete' do
      context 'when delete an item' do
        it 'should delete one item from items' do
        item = Item.new({
          id: 1,
          name: nil,
          price: nil
        })

        sql = "DELETE FROM items WHERE id = #{item.id}"
        mock_db = double
        allow(Mysql2::Client).to receive(:new).and_return(mock_db)
        expect(mock_db).to receive(:query).with(sql)

        item::delete_item
       end
      end
    end
  end
end