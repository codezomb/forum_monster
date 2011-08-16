class CreateTopicsTable < ActiveRecord::Migration
  def self.up
    create_table :topics, :force => true do |t|
      t.string   :title
      t.integer  :hits, :default => 0
      t.boolean  :sticky, :default => false
      t.boolean  :locked, :default => false
      t.integer  :posts_count
      t.integer  :forum_id
      t.integer  :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end