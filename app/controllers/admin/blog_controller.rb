class Admin::BlogController < AdminController

  cache_sweeper :blog_post_sweeper, :except => [ :index ]

  def index
    @posts = BlogPost.find :all, :order => "created_at desc"
  end

  def edit_post
    @blog_post = BlogPost.find params[:id] if params[:id]
    if request.post?
      # Save and stuff
      if @blog_post
        @blog_post.update_attributes! params[:blog_post]
      else
        p=params[:blog_post].merge({:author_id => current_user.id})
        BlogPost.create! p
      end
      redirect_to :action => :index
    end
  end

end
