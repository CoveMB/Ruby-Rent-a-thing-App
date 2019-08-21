class AddNewMessageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :new_message, :boolean, default: false
  end
end
