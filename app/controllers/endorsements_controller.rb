class EndorsementsController < ApplicationController
  
  def index
    subtitle 'Endorsements'
    @electeds = EndorsementList.electeds
    @leaders = EndorsementList.leaders
  end

end
