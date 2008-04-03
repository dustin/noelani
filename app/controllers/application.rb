# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  caches_page :index

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '7b1d504b6aba2ff18777fca2dde31663'

  def initialize
    @page_title = 'Noelani Sallings for Santa Clara Unified School District Board of Education'
  end

  protected

  def title(t)
    @page_title=t
  end

  def subtitle(t)
    title "#{t} -- Noelani Sallings for School Board"
  end

end
