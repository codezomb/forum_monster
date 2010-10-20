module Community
   require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
   require 'acts_as_community_member/base'
end