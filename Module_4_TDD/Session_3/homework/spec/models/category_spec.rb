require_relative '../../app/db/db_connection'
require_relative '../../app/models/category'

describe Category do

    describe '#valid?' do
        context 'when given valid input' do
            it 'should return true' do
                categories = Category.new({
                    id: 1,
                    name: "Main Dish"
                })
                expect(categories.valid?).to eq(true)
            end
        end
    end
end