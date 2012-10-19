class WelcomeController < ApplicationController
  def index
    @title = t :home
    if signed_in?
    @performer_stories = current_user.stories_for_me
    @creator_stories = current_user.my_stories
    end
  end
end
