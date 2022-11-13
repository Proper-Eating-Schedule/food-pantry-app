# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :database_authenticatable
  validates :email, presence: true, uniqueness: true, format: { with: /\A.+@.+\..+\z/, message: 'has incorrect format' }
end
