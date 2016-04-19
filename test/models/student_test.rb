require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "student belongs to teacher" do
    student = students(:alice_smith)
    teacher = teachers(:mrs_science_lady)

    assert_equal student.teacher_id, teacher.id
  end

  test "student has many parents" do
    parent_1 = parents(:james_mcjim)
    parent_2 = parents(:jacob_mcjim)

    assert_equal parent_1.student_id, parent_2.student_id
  end

  test "student has many grades" do
    grade_2 = grades(:grade_2)
    grade_3 = grades(:grade_3)
    student = students(:jimmy_mcjim)

    assert grade_2.student_id == grade_3.student_id
    assert student.id = grade_2.student_id
    assert student.id = grade_3.student_id
  end
end
