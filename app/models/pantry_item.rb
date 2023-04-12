# frozen_string_literal: true

class PantryItem < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true
  validates :measurement, presence: true
  validates :expire_date, presence: true
  belongs_to :product
end
