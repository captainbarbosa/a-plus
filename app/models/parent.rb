class Parent < ActiveRecord::Base
  belongs_to :student
  has_one :user

  validates :name, :student_id, presence: true
  accepts_nested_attributes_for :user
end
