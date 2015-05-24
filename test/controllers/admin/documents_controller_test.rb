require 'test_helper'

class Admin::DocumentsControllerTest < ActionController::TestCase

  fixtures :documents  

  test "should document on new page have input fields" do
    get :new
    assert_select 'form input', 3
  end     

  test "should admin-document on show 1 page have title1" do
    get :show, {'id' => "1"}
    assert_select 'h2.title_h2', 'title1'
  end    

  test "should destroy document" do
    document = documents(:one)
    assert_difference('Document.count', -1) do
      delete :destroy, { id: 1}
    end
  end  

  test "should admin-document on show 2 page route check" do
    get :show, {'id' => "2"}
    assert_routing '/admin/documents/2', { controller: "admin/documents", action: "show", id: "2" }
  end    

end
