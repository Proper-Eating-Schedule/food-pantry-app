# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :category
end
