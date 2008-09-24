class AddFormatToBlogPost < ActiveRecord::Migration
  def self.up
    add_column :blog_posts, :format, :string
    execute "update blog_posts set format='markdown'"
  end

  def self.down
    remove_column :blog_posts, :format
  end
end
