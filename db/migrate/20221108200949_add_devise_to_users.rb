# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
  end

  def self.down
    remove_columns :users, :encrypted_password, :reset_password_token, :reset_password_sent_at,
                   :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
    remove_index :users, :email
    remove_index :users, :reset_password_token
    remove_index :users, :confirmation_token
    remove_index :users, :confirmation_token
  end
end
