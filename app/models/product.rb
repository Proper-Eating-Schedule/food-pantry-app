# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :pantry_items

  validates :name, presence: true, uniqueness: true
end
