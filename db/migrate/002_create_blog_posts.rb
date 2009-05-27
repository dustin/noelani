class CreateBlogPosts < ActiveRecord::Migration
  def self.up
    create_table :blog_posts do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.integer :author_id, :null => false
      t.boolean :released, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :blog_posts
  end
end
