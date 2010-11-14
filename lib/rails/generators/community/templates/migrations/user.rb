class <%= "Update#{plural_camel_case_name}Table" %> < ActiveRecord::Migration
  def self.up
    add_column :<%= plural_lower_case_name %>, :topics_count, :integer, :default => 0
    add_column :<%= plural_lower_case_name %>, :posts_count, :integer, :default => 0
  end

  def self.down
    remove_column :<%= plural_lower_case_name %>, :topics_count
    remove_column :<%= plural_lower_case_name %>, :posts_count
  end
end