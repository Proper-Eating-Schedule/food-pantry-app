# frozen_string_literal: true

class CreatePantryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :pantry_items do |t|
      t.string :name
      t.decimal :quantity
      t.string :measurement
      t.date :expire_date
      t.timestamps
    end
  end
end
