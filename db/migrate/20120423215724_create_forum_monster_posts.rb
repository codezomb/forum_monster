class CreateForumMonsterPosts < ActiveRecord::Migration
  def change
    create_table :forum_monster_posts do |t|
      t.text :body
      t.boolean :flagged,       :default => false
      t.boolean :approved,      :default => false
      t.boolean :initial_post,  :default => false
      
      t.integer :topic_id
      t.integer :poster_id
      t.string  :poster_type

      t.timestamps
    end
    add_index :forum_monster_posts, :topic_id
    add_index :forum_monster_posts, :poster_id
  end
end
