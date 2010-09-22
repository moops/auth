require 'test_helper'
require 'digest/sha2'

class UserTest < ActiveSupport::TestCase
  
  test "user_count" do
    assert_equal 2, User.count
  end
  
  test "save without required fields" do
    a = User.new
    assert !a.save, 'saved without name'
    a.name= 'fred flintstone'
    
    assert !a.save, 'saved without user_name'
    a.user_name= 'fred'
    
    assert !a.save, 'saved without salt'
    a.salt= '3WfmUfZT4ZU='
    
    assert !a.save, 'saved without hashed_password'
    a.hashed_password= Digest::SHA2.hexdigest(a.salt + 'fred_pass')
    
    assert a.save, 'save with all required fields'
  end
  
  test "authenticate" do
    assert_not_nil User.authenticate('adam', 'adam_pass'), 'authenticate adam'
    assert_not_nil User.authenticate('quinn', 'quinn_pass'), 'authenticate quinn'
    assert_nil User.authenticate('adam', 'wrong_pass'), 'password is wrong'
    assert_nil User.authenticate('not_adam', 'adam_pass'), 'user should not be found'
  end
  
  test "age" do
    adam = User.find_by_user_name('adam');
    assert_equal 41, adam.age
    
    quinn = User.find_by_user_name('quinn');
    assert_equal 14, quinn.age
    
    adam.born_on += 1.days
    assert_equal 40, adam.age, 'birthday has not arrived yet'
  end
  
end
