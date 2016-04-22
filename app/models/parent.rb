class Parent < ActiveRecord::Base
  belongs_to :student
  has_one :user

  accepts_nested_attributes_for :user
end
