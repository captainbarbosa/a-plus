require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.find_by(email: "mathman@email.com")
    sign_in @user
    @user = users(:mr_math_man)
  end


  test "should get new" do
    get :new
    assert_response :success
  end


  test "should create user" do
    assert_difference "User.count", +1 do
      post :create, user: { email: "test@email.com",
        password: "password",
        password_confirmation: "password"
      }
      assert_equal( {}, assigns(:user).errors.messages )
    end
  end
end
