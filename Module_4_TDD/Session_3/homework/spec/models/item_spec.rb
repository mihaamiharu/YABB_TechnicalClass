require_relative '../../app/models/item'
require_relative '../../app/db/db_connection'

describe Item do
    describe '#valid?' do
    context 'when given valid input' do
      it 'return valid is true' do
        params = {
          id: 1,
          name: 'Jellopy',
          price: 15000
        }

        item = Item.new(params)

        expect(item.valid?).to eq(true)
      end
    end

    context 'when given invalid input' do
      it 'return false when name is nil' do
        params = {
          id: 1,
          price: 15000
        }

        item = Item.new(params)

        expect(item.valid?).to be_falsey #be falsey means false
      end

      it 'return false when price is nil' do
        params = {
          id: 1,
          name: 'Jellopy'
        }

        item = Item.new(params)

        expect(item.valid?).to be_falsey #be falsey means false
      end
    end
  end

end