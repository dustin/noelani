require File.dirname(__FILE__) + '/../test_helper'

class AdminControllerTest < ActionController::TestCase

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

  def test_authorized_user
    login_as :noelani
    get :index
    assert_response :success
  end

  def test_blog_unauthenticated
    get :blog
    assert_redirected_to login_path
  end

  def test_blog_unauthorized
    login_as :quentin
    get :blog
    assert_redirected_to login_path
  end

  def test_blog_authorized
    login_as :noelani
    get :blog
    assert_response :success
    assert_equal 3, assigns(:posts).size
  end

  def test_edit_new_post
    login_as :noelani
    get :edit_post
    assert_response :success
    assert_nil assigns(:blog_post)
  end

  def test_edit_existing_post
    login_as :noelani
    get :edit_post, :id => blog_posts(:one).id.to_s
    assert_response :success
    assert_equal blog_posts(:one), assigns(:blog_post)
  end

  def test_save_existing_post
    login_as :noelani
    post :edit_post, :id => blog_posts(:one).id.to_s,
      :blog_post => { :title => 'New Title', :content => 'New Content' }
    assert_redirected_to :action => :blog
    bp = blog_posts(:one).reload
    assert_equal bp, assigns(:blog_post)
    assert_equal 'New Title', bp.title
    assert_equal 'New Content', bp.content
  end

end
