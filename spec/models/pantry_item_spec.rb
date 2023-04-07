# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PantryItem, type: :model do
  subject { PantryItem.new(name: 'TestPantryItem', quantity: 3, measurement: 'szt', expire_date: '2023-05-01') }

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
end
