require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  
    it 'is valid with valid attributes' do
      product = Product.new(name: "Monsterra", price: 40, quantity: 20, category: Category.new)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product = Product.new(name: nil, price: 40, quantity: 20, category: Category.new)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      product = Product.new(name: "Monsterra", price: false, quantity: 20, category: Category.new)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price is not a number") 
    end

    it 'is not valid without a quantity' do
      product = Product.new(name: "Monsterra", price: 40, quantity: nil, category: Category.new)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      product = Product.new(name: "Monsterra", price: 40, quantity: 20, category: nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category must exist")
    end
  end
end
