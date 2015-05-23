require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "should not save user without name" do
    user = User.create(  :name => '',
                :email => 'xx@ad.ad',
                :password_confirmation => 'qwerty1234',
                :password => 'qwerty1234',
                :admin => false
                )
	  assert_not user.save
	end  

  test "should save user with name" do
    user = User.create(  :name => 'name',
                :email => 'xx@ad.ad',
                :password_confirmation => 'qwerty1234',
                :password => 'qwerty1234',
                :admin => false
                )
    assert user.save
  end   

  test "should not save user not equal passwords" do
    @user = User.create(  :name => 'name',
                :email => 'xx@ad.ad',
                :password_confirmation => 'qwerty1234',
                :password => 'qwerty12345',
                :admin => false
                )
    assert_not @user.save
  end    

  test "should user one is exist" do
    assert(users(:one) != nil)
  end    

  test "should some user is valid" do
    @user_ = User.create(  :name => 'name_',
                :email => 'xx_@ad.ad',
                :password_confirmation => 'qwerty1234',
                :password => 'qwerty1234',
                :admin => false
                )    
    @user = User.create(  :name => 'name',
                :email => 'xx@ad.ad',
                :password_confirmation => 'qwerty1234',
                :password => 'qwerty1234',
                :admin => false
                )  

    assert @user.valid?
  end  

  test "should some user is not valid" do
    @user_ = User.create(  :name => 'name',
                :email => 'xx@ad.ad',
                :password_confirmation => 'qwerty1234',
                :password => 'qwerty1234',
                :admin => false
                )    
    @user = User.create(  :name => 'name',
                :email => 'xx@ad.ad',
                :password_confirmation => 'qwerty1234',
                :password => 'qwerty1234',
                :admin => false
                )  

    assert_not @user.valid?
  end    
      
  test "should user three have name is equal name3" do
    assert_equal(users(:three).name, 'name3')
  end          

  test "should some user have name is equal name" do
    @user = User.create(  :name => 'name',
                :email => 'xx@ad.ad',
                :password_confirmation => 'qwerty1234',
                :password => 'qwerty1234',
                :admin => false
                )     
    assert_equal(@user.name, 'name')
  end   

end
