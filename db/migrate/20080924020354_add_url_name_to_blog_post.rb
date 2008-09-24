class AddUrlNameToBlogPost < ActiveRecord::Migration
  def self.up
    add_column :blog_posts, :url_name, :string

    BlogPost.all.each {|bp| bp.title = bp.title; bp.save!}
  end

  def self.down
    remove_column :blog_posts, :url_name
  end
end
