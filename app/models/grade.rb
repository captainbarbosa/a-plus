class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher

  validates :student_id, :assignment_name, presence: true
  validates_inclusion_of :grade, :in => 0..100, :message => "must a value between 1 and 100"
end
