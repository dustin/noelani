class BlogController < ApplicationController

  include AuthenticatedSystem
  helper ::ActionView::Helpers::TextHelper

  before_filter :login_required, :only => [ :unreleased ]
  caches_page :show

  def index
    subtitle 'Blog'
    @blog_posts = BlogPost.recent.visible
  end

  def show
    @post = BlogPost.find_by_url_name(params[:id])
    if @post
      render
    else
      render :text => "No such blog post", :status => 404
    end
  end

  def unreleased
    subtitle "Blog - Unreleased for #{current_user.login}"
    @blog_posts = BlogPost.recent
    render :action => :index
  end
  
end
