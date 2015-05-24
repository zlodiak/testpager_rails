require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  #test "should get index" do
  #  get :index
  #  assert_response :success
  #end

  test "should render index template and admin layout for index action" do
    get :index
    assert_template 'index'
    assert_template layout: "layouts/admin/admin"
  end     

end
