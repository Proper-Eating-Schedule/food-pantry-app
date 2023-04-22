# frozen_string_literal: true

class PantryItem < ApplicationRecord
  belongs_to :product

  validates :name, presence: true
  validates :quantity, presence: true
  validates :measurement, presence: true
  validates :expire_date, presence: true
end
