class Teacher < ActiveRecord::Base
  has_many :students
  has_many :grades
  has_one :user

  accepts_nested_attributes_for :user
end
