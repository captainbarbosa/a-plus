require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  test "grade belongs to a student" do
    grade = grades(:grade_1)
    student = students(:alice_smith)

    assert_equal grade.student_id, student.id
  end

  test "grade belongs to a teacher" do
    grade = grades(:grade_1)
    teacher = teachers(:mrs_science_lady)

    assert_equal grade.teacher_id, teacher.id
  end
end
