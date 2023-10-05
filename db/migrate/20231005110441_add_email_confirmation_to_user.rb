class AddEmailConfirmationToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_confirmation, :string, null: false
  end
end
