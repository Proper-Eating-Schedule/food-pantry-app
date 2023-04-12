# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PantryItem, type: :model do
  let!(:existing_category) { Category.create(name: 'Test4') }

  let!(:existing_product) { Product.create(name: 'Test123', category_id: existing_category.id) }

  subject do
    PantryItem.new(name: 'TestPantryItem',
                   quantity: 5, measurement: 'szt', expire_date: '25-04-2023', product_id: existing_product.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a measurement' do
    subject.measurement = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a expire date' do
    subject.expire_date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a product id' do
    subject.product_id = nil
    expect(subject).to_not be_valid
  end
end
