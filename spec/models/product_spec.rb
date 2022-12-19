require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject {
      Product.create(
        name: "Monsterra",
        price: 40,
        quantity: 20,
        category: Category.create(name: "Wasabi")
      )
    }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      subject.price = false
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Price is not a number") 
    end

    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category must exist")
    end
  end
end
