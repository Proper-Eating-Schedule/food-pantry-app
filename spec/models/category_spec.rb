# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new(name: 'Testing') }

  let!(:existing_category) { Category.create(name: 'Diary') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when name is not unique' do
    subject.name = existing_category.name
    expect(subject).to_not be_valid
  end
end
