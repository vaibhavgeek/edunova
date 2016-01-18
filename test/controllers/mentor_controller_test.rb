require 'test_helper'

class MentorControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
