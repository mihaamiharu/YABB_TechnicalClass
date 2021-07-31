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
      context 'when select all items' do
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

          Item.show_items
        end
      end

      context 'when select one item' do
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

          Item.show_itemCategory(1)
        end
      end
    end
  end
end