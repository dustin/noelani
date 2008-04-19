class EndorsementSweeper < ActionController::Caching::Sweeper
  observe Endorsement, EndorsementList

  def after_save(endo)
    expire_cache(endo)
  end

  def after_destroy(endo)
    expire_cache(endo)
  end

  def expire_cache(endo)
    expire_page :controller => '/endorsements', :action => :index
    expire_page :controller => '/admin/endorsements', :action => :index
  end

end