require 'test_helper'

class CommendantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commendants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commendant" do
    assert_difference('Commendant.count') do
      post :create, :commendant => { }
    end

    assert_redirected_to commendant_path(assigns(:commendant))
  end

  test "should show commendant" do
    get :show, :id => commendants(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => commendants(:one).to_param
    assert_response :success
  end

  test "should update commendant" do
    put :update, :id => commendants(:one).to_param, :commendant => { }
    assert_redirected_to commendant_path(assigns(:commendant))
  end

  test "should destroy commendant" do
    assert_difference('Commendant.count', -1) do
      delete :destroy, :id => commendants(:one).to_param
    end

    assert_redirected_to commendants_path
  end
end
