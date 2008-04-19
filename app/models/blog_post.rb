# == Schema Information
# Schema version: 4
#
# Table name: blog_posts
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  content    :string(255)     not null
#  author_id  :integer         not null
#  released   :boolean         
#  created_at :datetime        
#  updated_at :datetime        
#

class BlogPost < ActiveRecord::Base

  belongs_to :author, :class_name => "User"

  def self.recent_visible(limit = 10)
    find :all, :conditions => { :released => true },
      :order => "created_at desc", :limit => limit
  end

end
