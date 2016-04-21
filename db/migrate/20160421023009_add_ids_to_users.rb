class AddIdsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :student_id, :integer
    add_column :users, :teacher_id, :integer
    add_column :users, :parent_id, :integer
  end
end
