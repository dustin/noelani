class BlogController < ApplicationController

  include AuthenticatedSystem
  helper ::ActionView::Helpers::TextHelper

  before_filter :login_required, :only => [ :unreleased ]

  def index
    subtitle 'Blog'
    @blog_posts = BlogPost.recent.visible
  end

  def show
    @post = BlogPost.visible.find_by_url_name(params[:id])
  end

  def unreleased
    subtitle "Blog - Unreleased for #{current_user.login}"
    @blog_posts = BlogPost.recent
    render :action => :index
  end
  
end
