class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :parents
  has_many :grades
  has_one :user

  accepts_nested_attributes_for :user
end
