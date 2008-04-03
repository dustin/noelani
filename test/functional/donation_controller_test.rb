require File.dirname(__FILE__) + '/../test_helper'

class DonationControllerTest < ActionController::TestCase

  def test_index
    get :index
    assert_response :success
    assert_template 'index'
  end

  def test_success
    get :success
    assert_response :success
    assert_template 'success'
  end

end
