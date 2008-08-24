class BlogPostSweeper < ActionController::Caching::Sweeper
  observe BlogPost

  def after_save(blog_post)
    expire_cache(blog_post)
  end

  def after_destroy(blog_post)
    expire_cache(blog_post)
  end

  def expire_cache(blog_post)
    expire_page :controller => '/blog', :action => :index
    expire_page :controller => '/admin/blog', :action => :index
  end

end