class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  # Can only have one of these per User
  belongs_to :student
  belongs_to :teacher
  belongs_to :parent
end
