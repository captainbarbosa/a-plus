require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @user = User.find_by(email: "mathman@email.com")
    sign_in @user
    @student = students(:alice_smith)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: {
        teacher_id: teachers(:mrs_science_lady).id,
        name: "Bob",
        user_attributes: {
          email: "bob@email.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end

    assert_redirected_to student_path(assigns(:student))
  end


  test "new student should create user" do
    assert_difference "User.count", +1 do
      post :create, student: {
        teacher_id: teachers(:mrs_science_lady).id,
        name: "Bob",
        user_attributes: {
          email: "bob@email.com",
          password: "password",
          password_confirmation: "password"
        }
      }

      assert_equal( {}, assigns(:student).errors.messages )
    end
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

end
