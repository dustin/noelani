module EndorsementsHelper

  def sup_dagger
    "<sup>&dagger;</sup>"
  end

  def show_endorser_title(title)
    title.strip.split(/\r?\n/).join("#{sup_dagger}<br/>") + sup_dagger
  end

end
