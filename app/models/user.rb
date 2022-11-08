# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /\A.+@.+\..+\z/, message: 'has incorrect format' }
  validates :username, presence: true, uniqueness: true
end
