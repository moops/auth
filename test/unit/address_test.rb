require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  
  test "save without required fields" do
    a = Address.new
    assert !a.save, 'saved without user_id'
    a.user= users(:adam)

    assert !a.save, 'saved without address'
    a.address= '666 red brick way'

    assert !a.save, 'saved without city'
    a.city= 'phoenix'

    assert a.save, 'save with all required fields'
  end
  
end
