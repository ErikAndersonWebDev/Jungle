require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new(name: "Something Green")
    @product = Product.new
  end
  describe 'Validations' do
    it 'is valid with a name, price, quantity and category' do
      @new_product = Product.new(name: "test", price: 5999, quantity: 4, category: @category)
      @new_product.save!
      expect(@new_product).to be_persisted
    end
    it 'is invalid if name is nil' do
      expect(@product).to_not be_valid
      expect(@product.errors[:name]).to include("can't be blank")
    end
    it 'is invalid if price is nil' do
      expect(@product).to_not be_valid
      expect(@product.errors[:price]).to include("can't be blank")
    end
    it 'is invalid if quantity is nil' do
      expect(@product).to_not be_valid
      expect(@product.errors[:quantity]).to include("can't be blank")
    end
    it 'is invalid if category is nil' do
      expect(@product).to_not be_valid
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end