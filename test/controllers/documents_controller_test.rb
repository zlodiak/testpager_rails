require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase

  fixtures :documents

  #setup do
  #  @document = documents(:one)
  #end

  test "should get index with parameter page" do
    get :index, :page => 3
    assert_response :success
  end

  test "should get index without parameter page" do
    get :index
    assert_response :success
  end  

  test "should render index template for index action" do
    get :index
    assert_template 'index'
    assert_template layout: "layouts/application"
  end   

  test "should get success response for show" do
    get :show, {'id' => "1"}
    assert_response :success
  end     

  test "should document index page have text Listing documents-" do
    get :index
    assert_select 'h1', 'Listing documents-'
  end    

  test "should document index page have text to admin" do
    get :index
    assert_select 'a', 'to admin'
  end    

  test "should document on show 1 page have text title1" do
    get :show, {'id' => "1"}
    assert_select 'h2', 'title1'
  end  

  test "should document on show 1 page dont have forms" do
    get :show, {'id' => "1"}
    assert_select 'form', false
  end       

  test "should document on index assigned var documents" do
    get :index
    assert_not_nil assigns(:documents)
  end     

  test "should document on show 2 page route check" do
    get :show, {'id' => "2"}
    assert_routing '/documents/2', { controller: "documents", action: "show", id: "2" }
  end  


  #test "should create document" do
  #  post :create, document: {title: 'Hi', body: 'This is my first article.'}

   # assert_equal 'Doc create', flash[:success]
  #end

=begin
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post :create, document: {  }
    end

    assert_redirected_to document_path(assigns(:document))
  end

  test "should show document" do
    get :show, id: @document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document
    assert_response :success
  end

  test "should update document" do
    patch :update, id: @document, document: {  }
    assert_redirected_to document_path(assigns(:document))
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete :destroy, id: @document
    end

    assert_redirected_to documents_path
  end
=end

end
