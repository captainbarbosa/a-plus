class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :parents
  has_many :grades
  has_one :user

  validates :name, :teacher_id, presence: true
  accepts_nested_attributes_for :user
end
