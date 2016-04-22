require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    @user = User.find_by(email: "mathman@email.com")
    sign_in @user
    @teacher = teachers(:mr_math_man)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('Teacher.count') do
      post :create, teacher: { name: "Dr. Doolittle", course: "Animal Science" }
    end

    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "new teacher should create user" do
    assert_difference "User.count", +1 do
      post :create, teacher: {
        name: "Mrs. Language Lady",
        user_attributes: {
          email: "hola@email.com",
          password: "password",
          password_confirmation: "password"
        }
      }

      assert_equal( {}, assigns(:teacher).errors.messages )
    end
  end

  test "should show teacher" do
    get :show, id: @teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher
    assert_response :success
  end

  test "should update teacher" do
    patch :update, id: @teacher, teacher: { name: "Mr. Math Man", course: "Linear Algebra" }
    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should destroy teacher" do
    assert_difference('Teacher.count', -1) do
      delete :destroy, id: @teacher
    end

    assert_redirected_to teachers_path
  end
end
