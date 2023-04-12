# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :category
  has_many :pantry_items
end
