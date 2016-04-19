require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  test "grade belongs to a student" do
    grade = grades(:grade_1)
    student = students(:Alice_Smith)

    assert_equal grade.student_id, student.id
  end
end
