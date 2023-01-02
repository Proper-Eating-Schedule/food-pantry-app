# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: 'test123@test.com', username: 'Test123') }

  let!(:existing_user) { User.create(email: 'test456@test.com', username: 'Test456') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when email is not unique' do
    subject.email = existing_user.email
    expect(subject).to_not be_valid
  end

  it 'is not valid when username is not unique' do
    subject.username = existing_user.username
    expect(subject).to_not be_valid
  end

  it 'is not valid when email has not proper format' do
    expect(subject.email.match?(/\A.+@.+\..+\z/)).to eq(true)
  end
end
