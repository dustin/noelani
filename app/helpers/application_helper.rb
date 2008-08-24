# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def q_sans_whitespace(&block)
    "<q>&#8220;#{capture_haml(&block).strip}&#8221;</q>"
  end

end
