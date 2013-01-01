class CreateForumMonsterForums < ActiveRecord::Migration
  def change
    create_table :forum_monster_forums do |t|
      t.string    :title
      t.text      :description
      t.boolean   :enabled,       :default => false
      t.integer   :topics_count,  :default => 0
      t.integer   :position,      :default => 0
      t.boolean   :hidden,        :default => false

      t.integer   :category_id

      t.timestamps
    end
    add_index :forum_monster_forums, :category_id
  end
end
