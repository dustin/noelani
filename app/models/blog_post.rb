# == Schema Information
# Schema version: 20080924031342
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
#  url_name   :string(255)
#  format     :string(255)
#

class BlogPost < ActiveRecord::Base

  acts_as_url_param

  validates_presence_of :format, :on => :create, :message => "can't be blank"

  belongs_to :author, :class_name => "User"

  named_scope :visible, :conditions => { :released => true }
  named_scope :recent, lambda { |*args| {:order => "created_at desc", :limit => (args.first || 10)} }

end
