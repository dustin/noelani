require 'test_helper'

class BallotControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
    assert_template 'index'
  end
end
