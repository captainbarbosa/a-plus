require 'test_helper'

class ParentTest < ActiveSupport::TestCase
  test "parent belongs to a student" do
    parent = parents(:jacob_mcjim)
    student = students(:jimmy_mcjim)

    assert_equal parent.student_id, student.id
  end
end
