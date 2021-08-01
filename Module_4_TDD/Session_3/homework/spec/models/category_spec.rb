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

        context 'when given invalid input' do
            it 'should return false when name is nil' do
                categories = Category.new({
                    id: 1,
                    name: nil
                })
      
              expect(categories.valid?).to be_falsey #be falsey means false
            end
        end
    end
end