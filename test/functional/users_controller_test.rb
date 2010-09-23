require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should find the user" do
    get :find, {:user_name => 'adam', :password => 'adam_pass'}
    assert_redirected_to user_path(assigns(:user))
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => { :name => 'fred flintstone', :user_name => 'fred', :salt => 'QjZDlyfzPVk=', :hashed_password => '295a1bfa47a980ffa939a3a8aac2d15612da5917b6af2233aa2f86cd36a21155' }
    end

    assert_redirected_to users_path
  end

  test "should show user" do
    get :show, :id => users(:quinn).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => users(:quinn).to_param
    assert_response :success
  end

  test "should update user" do
    put :update, :id => users(:quinn).to_param, :user => { :name => 'quinn thomas lawrence' }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:quinn).to_param
    end

    assert_redirected_to users_path
  end
end
