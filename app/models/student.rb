class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :parents
  has_many :grades
end
