require File.dirname(__FILE__) + '/../../test_helper'

class Admin::EndorsementsControllerTest < ActionController::TestCase
  include AuthenticatedTestHelper

  def test_authentication_required
    get :index
    assert_redirected_to login_path
  end

  def test_unauthorized_user
    login_as :quentin
    get :index
    assert_redirected_to login_path
  end

  def test_index
    login_as :noelani
    get :index
    assert_response :success
    assert assigns(:lists)
  end

  def test_add
    login_as :noelani
    assert_difference 'Endorsement.count' do
      post :add, :endorsement => { :name => 'Bob', :title => 'Subgenious',
        :endorsement_list_id => endorsement_lists(:individuals).id }
    end
    assert_redirected_to :action => 'index'
  end

  def test_destroy
    login_as :noelani
    assert_difference 'Endorsement.count', -1 do
      post :delete, :id => endorsements(:mom).id.to_s, :format => 'js'
    end
    assert_response :success
  end

  def test_sort
    login_as :noelani
    assert_equal endorsements(:mom, :dad), endorsement_lists(:individuals).endorsements
    lid=endorsement_lists(:individuals).id
    post :sort, :id => lid.to_s, :format => 'js',
      "endorsements_#{lid}".to_sym => endorsements(:dad, :mom).map{|e| e.id.to_s}
    assert_response :success
    assert_equal endorsements(:dad, :mom), endorsement_lists(:individuals).reload.endorsements
  end
end
