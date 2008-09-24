module AboutHelper
  def locality(city)
    %Q{<span class="locality">#{city}</span>,}
  end
end
