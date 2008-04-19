class EndorsementsController < ApplicationController
  
  def index
    subtitle 'Endorsements'
    @electeds = EndorsementList.find_by_title 'Elected Officials'
    @leaders = EndorsementList.find_by_title 'Community Leaders'
  end

end
