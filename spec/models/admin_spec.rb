# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject { Admin.new(email: 'test1234@test.com') }

  let!(:existing_admin) { Admin.create(email: 'test4567@test.com') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not be valid when email is not unique' do
    subject.email = existing_admin.email
    expect(subject).to_not be_valid
  end

  it 'is not valid when email has not proper format' do
    expect(subject.email.match?(/\A.+@.+\..+\z/)).to eq(true)
  end
end
