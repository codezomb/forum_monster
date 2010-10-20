class <%= "Update#{plural_camel_case_name}Table" %> < ActiveRecord::Migration
  def self.up
    add_column :<%= plural_lower_case_name %>, :community_admin, :boolean, :default => false
    add_column :<%= plural_lower_case_name %>, :community_moderator, :boolean, :default => false
    add_column :<%= plural_lower_case_name %>, :topics_count, :boolean, :default => false
    add_column :<%= plural_lower_case_name %>, :posts_count, :boolean, :default => false
  end

  def self.down
    remove_column :<%= plural_lower_case_name %>, :community_admin
    remove_column :<%= plural_lower_case_name %>, :community_moderator
    remove_column :<%= plural_lower_case_name %>, :topics_count
    remove_column :<%= plural_lower_case_name %>, :posts_count
  end
end