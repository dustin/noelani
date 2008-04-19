class AdminController < ApplicationController
  include AuthenticatedSystem

  before_filter :login_required

  protected

  def authorized?
    logged_in? && %w(noelani dustin).include?(current_user.login)
  end
end