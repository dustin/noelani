require File.dirname(__FILE__) + '/../test_helper'

class NewsControllerTest < ActionController::TestCase

  def test_index
    get :index
    assert_response :success
    assert_template 'index'
  end

end
