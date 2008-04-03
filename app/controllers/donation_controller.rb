class DonationController < ApplicationController

  caches_page :success

  def index
    subtitle 'Donate'
  end

  def success
    subtitle 'Donation Successful'
  end
end
