class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :login, :string
    remove_column :users, :password_digest, :string
  end
end
