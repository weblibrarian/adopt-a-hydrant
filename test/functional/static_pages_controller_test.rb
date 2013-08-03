require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get CARA" do
    get :CARA
    assert_response :success
  end

end
