require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  setup do
    @student = User.find_by(email: "alice@email.com")
    @teacher = User.find_by(email: "sciencerulez@email.com")
  end

  test "grade belongs to a student" do
    grade = grades(:grade_1)

    assert_equal grade.student_id, @student.id
  end

  test "grade belongs to a teacher" do
    grade = grades(:grade_1)

    assert_equal grade.teacher_id, @teacher.id
  end

  test "grade must have a student id and grade value" do
    grade = Grade.create()

    assert_equal false, grade.valid?
  end

  test "grade must have a numerical range between 1-100" do
    grade = Grade.create(assignment_name: "Math practice", grade: 101, student_id: @student.id)

    assert_equal false, grade.errors.messages.empty?
    assert_equal false, grade.valid?
  end
end
