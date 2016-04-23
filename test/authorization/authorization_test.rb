require 'test_helper'

class AuthorizationTest < ActionController::TestCase
  setup do
    @teacher = User.find_by(email: "mathman@email.com")
    @student = User.find_by(email: "carl@email.com")
    @parent = User.find_by(email: "jane@email.com")
    @grade = Grade.find_by(assignment_name: "Practice working with Fractions")
  end

  test "teachers are authorized to create teachers" do
    @controller = TeachersController.new
    sign_in @teacher

    assert_difference('Teacher.count') do
      post :create, teacher: { name: "Dr. Doolittle", course: "Animal Science" }
    end

    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "students and parents are not authorized to create teachers" do
    @controller = TeachersController.new
    sign_in @student
    post :create, teacher: { name: "Dr. Doolittle", course: "Animal Science" }
    assert_redirected_to root_path

    sign_out @student
    sign_in @parent
    post :create, teacher: { name: "Dr. Doolittle", course: "Animal Science" }
    assert_redirected_to root_path
  end

  test "only teachers are authorized to create students" do
    @controller = StudentsController.new
    sign_in @teacher

    assert_difference('Student.count') do
      post :create, student: {
        teacher_id: teachers(:mrs_science_lady).id,
        name: "Coraline",
        user_attributes: {
          email: "coraline@email.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "students and parents are not authorized to create students" do
    @controller = StudentsController.new
    sign_in @student
    post :create, student: { teacher_id: @teacher.id, name: "Francis Frankfurter" }
    assert_redirected_to root_path

    sign_out @student
    sign_in @parent
    post :create, student: { teacher_id: @teacher.id, name: "Francis Frankfurter" }
    assert_redirected_to root_path
  end

  test "only teachers are authorized to create parents" do
    @controller = ParentsController.new
    sign_in @teacher

    assert_difference('Parent.count') do
      post :create, parent: {
        name: "Bob Cannoli",
        student_id: students(:carl_cannoli).id,
        user_attributes: {
          email: "bob@email.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end

    assert_redirected_to parent_path(assigns(:parent))
  end

  test "students and parents are not authorized to create parents" do
    @controller = ParentsController.new
    sign_in @student
    post :create, parent: { student_id: @student.id, name: "Carol Cannoli" }
    assert_redirected_to root_path

    sign_out @student
    sign_in @parent
    post :create, parent: { student_id: @student.id, name: "Carol Cannoli" }
    assert_redirected_to root_path
  end

  test "only teachers are authorized to create grades" do
    @controller = GradesController.new
    sign_in @teacher

    assert_difference('Grade.count') do
      post :create, grade: { assignment_name: "Algebra Practice", grade: 100, student_id: @student.id }
    end

    assert_redirected_to grade_path(assigns(:grade))
  end

  test "only teachers are authorized to update grades" do
    @controller = GradesController.new
    sign_in @teacher

    patch :update, id: @grade.id, grade: { assignment_name: "Algebra Practice", grade: 90, student_id: @student.id }

    assert_redirected_to grade_path(assigns(:grade))
  end

  test "only teachers are authorized to delete grades" do
    @controller = GradesController.new
    sign_in @teacher

    assert_difference "Grade.count", -1 do
      delete :destroy, id: @grade.id
    end
  end

  test "students and parents are not allowed to create grades" do
    @controller = GradesController.new
    sign_in @student
    assert_difference "Grade.count", 0 do
      delete :destroy, id: @grade.id
    end
    assert_redirected_to root_path

    sign_out @student
    sign_in @parent
    assert_difference "Grade.count", 0 do
      delete :destroy, id: @grade.id
    end
    assert_redirected_to root_path
  end

  test "students and parents are not allowed to update grades" do
    @controller = GradesController.new
    sign_in @student
    patch :update, id: @grade.id, grade: { assignment_name: "Algebra Practice", grade: 90, student_id: @student.id }
    assert_redirected_to root_path

    sign_out @student
    sign_in @parent
    patch :update, id: @grade.id, grade: { assignment_name: "Algebra Practice", grade: 90, student_id: @student.id }
    assert_redirected_to root_path
  end

  test "students and parents are not allowed to delete grades" do
    @controller = GradesController.new
    sign_in @student
    delete :destroy, id: @grade.id
    assert_redirected_to root_path

    sign_out @student
    sign_in @parent
    delete :destroy, id: @grade.id
    assert_redirected_to root_path
  end
end
