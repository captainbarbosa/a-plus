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
end
