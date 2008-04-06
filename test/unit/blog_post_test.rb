require File.dirname(__FILE__) + '/../test_helper'

class BlogPostTest < ActiveSupport::TestCase

  def test_find_blog_posts
    assert_equal [blog_posts(:one), blog_posts(:two)], BlogPost.recent_visible
  end

  def test_author_assoc
    assert_equal users(:quentin), blog_posts(:one).author
  end

end
