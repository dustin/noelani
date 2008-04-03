class DonationController < ApplicationController

  def index
    subtitle 'Donate'
  end

  def success
    subtitle 'Donation Successful'
  end
end
