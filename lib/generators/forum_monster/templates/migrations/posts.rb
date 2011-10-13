class CreatePostsTable < ActiveRecord::Migration
  def self.up
    create_table :posts, :force => true do |t|
      t.text     :body
      t.integer  :forum_id
      t.integer  :topic_id
      t.integer  :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end