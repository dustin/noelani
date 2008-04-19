require File.dirname(__FILE__) + '/../test_helper'

class EndorsementsControllerTest < ActionController::TestCase

  def test_index
    get :index
    assert_response :success
    assert_template 'index'
    assert_equal endorsement_lists(:electeds), assigns(:electeds)
    assert_equal endorsement_lists(:individuals), assigns(:leaders)
  end

end
