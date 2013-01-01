module ForumMonster
  class ApplicationController < ActionController::Base
    respond_to :html
    helper_method :fm_current_user

    ###
    # Use this instead of current_user
    # Method defaults to current_user
    ###
    def fm_current_user
      m = ForumMonster::Configuration.current_user
      method(m).call
    end

  end
end