require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   # setup() will run before each method
    def setup
       @user = User.new
       @user.name = '**unit-test**'
       @user.username = "dexter"
       @user.email = "dexter@cenas.com"
       @user.password = "12344"
    end 
 
    def test_save_with_valid_data
        assert @user.save
        assert @user.errors.empty?
    end
 
    def test_save_with_invalid_name
        @user.name = nil
        assert @user.save
        assert @user.errors.size > 0
    end

    def test_save_with_invalid_email
        @user.email = "dexter@cenascom"
        assert !@user.save
        assert @user.errors.size > 0
    end

    def test_save_with_invalid_username
        @user.username = nil
        assert !@user.save
        assert @user.errors.size > 0
    end
    

=begin
   test "should not save user without name" do
	  user = User.new
	  assert !user.save, "Saved the user"
    end

    test "should not save user without password < 5 char" do
    	user = users(:dexter)
    	user = User.new(user.attributes)
    	user.skip_confirmation!

	  	assert !user.save, "Saved the user"
    end=end





end
