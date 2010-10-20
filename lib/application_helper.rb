module ApplicationHelper
  
  # Convenience methods for admin, and moderator
  
  def admin?
    current_user.community_admin?
  end
   
  def moderator?
    current_user.community_moderator?
  end
   
  def can_sticky_topic?
     admin? || moderator?
   end
   
   def can_lock_topic?
    admin? || moderator?
   end
   
   # Convenience method for the engine stylesheet
   
   def community_stylesheet_tag
     stylesheet_link_tag 'community'
   end
end