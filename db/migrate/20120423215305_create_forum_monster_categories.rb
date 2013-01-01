class CreateForumMonsterCategories < ActiveRecord::Migration
  def change
    create_table :forum_monster_categories do |t|
      t.string  :name
      t.integer :position, :default => 0
      t.boolean  :hidden, :default => false
      t.timestamps
    end
  end
end
