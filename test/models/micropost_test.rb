require 'test_helper'

class MicropostTest < ActiveSupport::TestCase


  test "should valid for length lte 140 symbols" do
    @micropost = Micropost.create(  
					    			:user_id => 1,
					                :content => 'qwerty'
								)
    assert @micropost.valid?
  end

  test "should not valid for length gt 140 symbols" do
    @micropost = Micropost.create(  
					    			:user_id => 1,
					                :content => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec qu'
								)
    assert_not @micropost.valid?
  end  
end
