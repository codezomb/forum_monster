module Community
  module ActsAsCommunityMember  
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
    
      module Config
        def acts_as_community_member
          has_many :topics, :class_name => 'Community::Topic', :dependent => :destroy
          has_many :posts, :class_name => 'Community::Post', :dependent => :destroy
        
          include Community::ActsAsCommunityMember::Base::InstanceMethods
        end
      end
    
      module InstanceMethods
        def community_avatar
          return nil
        end
      end
    end  
  end
end

::ActiveRecord::Base.send :include, Community::ActsAsCommunityMember::Base