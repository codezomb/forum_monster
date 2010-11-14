require 'rails/generators'
require 'rails/generators/migration'

class Community::InstallGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  desc "Installs the Community Forum Engine."
  
  argument :user_model, :type => :string, :required => true, :desc => "Your user model name."
  
  attr_reader :singular_camel_case_name, :plural_camel_case_name, :singular_lower_case_name, :plural_lower_case_name
  
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end
  
  # Generate the migration timestamp
  
  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end
  
  # Get the names for the User model
  # Generate the models
  
  def go
    @singular_camel_case_name = user_model.singularize.camelize
    @plural_camel_case_name = user_model.pluralize.camelize
    @singular_lower_case_name = user_model.singularize.underscore
    @plural_lower_case_name = user_model.pluralize.underscore
  	
    template 'models/topic.rb', 'app/models/community/topic.rb'
    template 'models/post.rb', 'app/models/community/post.rb'
  end
  
  # Create the migration files
  
  def create_migration_file
    migration_template 'migrations/forums.rb', 'db/migrate/create_forums_table.rb'
    sleep(1)
    migration_template 'migrations/topics.rb', 'db/migrate/create_topics_table.rb'
    sleep(1)
    migration_template 'migrations/posts.rb', 'db/migrate/create_posts_table.rb'
  end
end