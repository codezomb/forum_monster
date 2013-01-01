module ForumMonster
  module ApplicationHelper

    def errors_for obj
      if obj.errors.any?
        errors = obj.errors.full_messages.join(', and ').humanize
        content_tag :div, errors, :id => "flash_error"
      end
    end

    def last_topic(forum)
      content_tag :div do
        if forum.latest_topic
          "#{forum.latest_topic.title}<br />
          by #{forum.latest_topic.poster.fm_username}".html_safe
        else
          "No Topics / Posts"
        end
      end.html_safe
    end

    def last_post(topic)
      content_tag :div do
        if topic.latest_post
          "#{l topic.latest_post.created_at, :format => :posted}<br />
          by #{topic.latest_post.poster.fm_username}".html_safe
        else
          "No Replies"
        end
      end.html_safe
    end

    def markup(text)
      text
    end

  end
end