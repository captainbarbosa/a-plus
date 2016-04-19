require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "student belongs to teacher" do
    student = students(:alice_smith)
    teacher = teachers(:mrs_science_lady)

    assert_equal student.teacher_id, teacher.id
  end

  test "student has many parents" do

  end

  test "student has many grades" do

  end
end
