require 'test_helper'

class AuthorizationTest < ActionController::TestCase
  setup do
    @teacher = User.find_by(email: "mathman@email.com")
    @student = User.find_by(email: "carl@email.com")
    @parent = User.find_by(email: "jane@email.com")
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
end
