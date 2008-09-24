module BlogHelper

  def render_post(post)
    case post.format
    when 'html'
      post.content
    when 'markdown'
      auto_link(markdown(post.content))
    else
      raise "Unknown format:  #{post.format}"
    end
  end

end
