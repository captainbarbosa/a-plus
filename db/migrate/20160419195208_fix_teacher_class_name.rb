class FixTeacherClassName < ActiveRecord::Migration
  def change
    rename_column :teachers, :class, :course
  end
end
