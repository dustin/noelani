# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def q_sans_whitespace(&block)
    "<q>“#{capture_haml(&block).strip}”</q>"
  end

end
