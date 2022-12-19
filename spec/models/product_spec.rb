require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'is valid with valid attributes' do
      @category = Category.create(name: "Wasabi")
      product = Product.new(name: "Monsterra", price: 40, quantity: 20, category: @category)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      @category = Category.create(name: "Wasabi")
      product = Product.create(name: nil, price: 40, quantity: 20, category: @category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @category = Category.create(name: "Wasabi")
      product = Product.create(name: "Monsterra", price: false, quantity: 20, category: @category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price is not a number") 
    end

    it 'is not valid without a quantity' do
      @category = Category.create(name: "Wasabi")
      product = Product.create(name: "Monsterra", price: 40, quantity: nil, category: @category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @category = Category.create(name: "Wasabi")
      product = Product.create(name: "Monsterra", price: 40, quantity: 20, category: nil)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category must exist")
    end
  end
end
