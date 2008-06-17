require File.dirname(__FILE__) + '/../test_helper'

class BlogControllerTest < ActionController::TestCase

  def test_index
    get :index
    assert_response :success
  end

end
