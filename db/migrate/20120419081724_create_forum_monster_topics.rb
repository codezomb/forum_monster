class CreateForumMonsterTopics < ActiveRecord::Migration
  def change
    create_table :forum_monster_topics do |t|
      t.string  :title
      t.text    :body
      t.boolean :stickied,    :default => false
      t.boolean :locked,      :default => false
      t.boolean :flagged,     :default => false
      t.integer :hits,        :default => 0
      t.integer :posts_count, :default => 0

      t.integer :forum_id
      t.integer :poster_id
      t.string  :poster_type

      t.datetime :last_updated_at
      t.timestamps
    end
    add_index :forum_monster_topics, :forum_id
    add_index :forum_monster_topics, :poster_id
  end
end
