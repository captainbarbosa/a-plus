require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    @user = User.find_by(email: "mathman@email.com")
    # Signing in an authorized user
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
  
end
