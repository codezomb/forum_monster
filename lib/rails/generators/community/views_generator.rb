require 'rails/generators'

class Community::ViewsGenerator < Rails::Generators::Base
  desc "Installs the Community Views, Stylesheets, and Images."  
  
  def self.source_root
    @source_root ||= File.expand_path('../../../../../', __FILE__)
  end
  
  # Copy the views
  def copy_views
    directory "app/views/community", "app/views/community"
    directory "public/stylesheets", "public/community/stylesheets"
    directory "public/images", "public/community/images"
  end
end