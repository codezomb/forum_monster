require 'community'
require 'rails'
require 'action_controller'
require 'application_helper'

class Community::Engine < Rails::Engine
  
  # Tasks
  rake_tasks do
    load File.join(File.dirname(__FILE__), 'rails/railsties/tasks.rake')
  end
  
  # Static Assets
  initializer "static assets" do |app|
    app.middleware.use ::ActionDispatch::Static, "#{root}/public"
  end
  
end