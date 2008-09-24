xml.instruct! :xml, :version => "1.0"
xml.rss "version" => "2.0" do
  xml.channel do
    xml.title "Noelani Sallings' Recent Items"
    xml.link home_url
    xml.language "en-us"
    xml.ttl "86400"
    xml.description "Keep up with what's going on with Noelani"
    xml.lastBuildDate ((@blog_posts.blank? ? Time.now : @blog_posts.map{|i| i.created_at}.max).rfc822)

    @blog_posts.each do |item|
      xml.item do
        xml.link blog_url(item)
        xml.title item.title
        xml.description auto_link(markdown(item.content))
        xml.pubDate item.created_at.rfc822
        xml.guid blog_url(item)
      end
    end
  end
end