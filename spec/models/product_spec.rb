require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid if it has a name, price, quantity and category" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create(
        name: "Scuba Suit",
        price: 120.00,
        quantity: 30
      )
      expect(product).to be_valid
      puts product.errors.full_messages
    end

    it "is not valid without a name" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create(
        name: nil,
        price: 120.00,
        quantity: 30
      )
      expect(product.errors).to have_key(:name)
      puts product.errors.full_messages
    end

    it "is not valid without a price" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create(
        name: "Scuba Suit",
        price: nil,
        quantity: 30
      )
      expect(product.errors).to have_key(:price)
      puts product.errors.full_messages
    end

    it "is not valid without a quantity" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create(
        name: "Scuba Suit",
        price: 120.00,
        quantity: nil
      )
      expect(product.errors).to have_key(:quantity)
      puts product.errors.full_messages
    end

    it "is not valid without a category" do
      product = Product.create(
        name: "Scuba Suit",
        price: 120.00,
        quantity: 30
      )
      expect(product.errors).to have_key(:category)
      puts product.errors.full_messages
    end
  end
end
