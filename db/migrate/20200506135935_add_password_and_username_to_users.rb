class AddPasswordAndUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :username
    add_column :users, :password, :string
  end
end
