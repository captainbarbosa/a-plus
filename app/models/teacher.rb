class Teacher < ActiveRecord::Base
  has_many :students
  has_many :grades
  has_one :user
end
