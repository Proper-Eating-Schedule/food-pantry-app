# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:existing_category) { Category.create(name: 'Test') }

  subject { Product.new(name: 'Product_Test', category_id: existing_category.id) }

  let!(:existing_product) { Product.create(name: 'Milk', category_id: existing_category.id) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when name is not unique' do
    subject.name = existing_product.name
    expect(subject).to_not be_valid
  end
end
