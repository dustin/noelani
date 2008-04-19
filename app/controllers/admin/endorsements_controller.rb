class Admin::EndorsementsController < AdminController

  cache_sweeper :endorsement_sweeper, :except => [ :index ]

  def index
    @lists = EndorsementList.find :all
  end

  def add
    Endorsement.create! params[:endorsement]
    redirect_to :action => :index
  end

  def sort
    el = EndorsementList.find params[:id]
    el.endorsements.each do |e|
      # we must add one to compensate for the zero based index.
      e.position = params["endorsements_#{el.id}"].index(e.id.to_s) + 1
      e.save!
    end
  end
end
