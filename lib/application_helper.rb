module ApplicationHelper
   
   # Convenience method for the engine stylesheet
   def community_stylesheet_tag
     stylesheet_link_tag 'community'
   end
   
   # Convenience method for parsing post body text
   def community_parse_text(text)
     return text
   end
   
end