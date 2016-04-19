require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  test "teachers have many students" do
    teacher = teachers(:mr_math_man)
    student_1 = students(:jimmy_mcjim)
    student_2 = students(:carl_cannoli)

    assert_equal teacher.id, student_1.teacher_id
    assert_equal teacher.id, student_2.teacher_id
  end

  test "teachers have many grades" do
    teacher = teachers(:mrs_science_lady)
    grade_1 = grades(:grade_1)
    grade_2 = grades(:grade_3)

    assert_equal teacher.id, grade_1.teacher_id
    assert_equal teacher.id, grade_2.teacher_id
  end
end
