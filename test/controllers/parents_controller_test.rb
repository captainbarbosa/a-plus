require 'test_helper'

class ParentsControllerTest < ActionController::TestCase
  setup do
    @user = User.find_by(email: "mathman@email.com")
    sign_in @user
    @parent = parents(:jane_smith)
    @student = students(:carl_cannoli)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent" do
    assert_difference('Parent.count') do
      post :create, parent: { student_id: @student.id, name: "Robert Ravioli" }
    end

    assert_redirected_to parent_path(assigns(:parent))
  end

  test "new parent should create user" do
    assert_difference "User.count", +1 do
      post :create, parent: {
        name: "Bob Cannoli",
        student_id: students(:carl_cannoli).id,
        user_attributes: {
          email: "bob@email.com",
          password: "password",
          password_confirmation: "password"
        }
      }

      assert_equal( {}, assigns(:parent).errors.messages )
    end
  end

  test "should show parent" do
    get :show, id: @parent
    assert_response :success
  end

end
