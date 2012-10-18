class WelcomeController < ApplicationController
  def index
    @title = t :home
    if signed_in?
    @performer_stories = Story.find_all_by_performer_id(current_user)
    @creator_stories = Story.find_all_by_creator_id(current_user)
    end
  end
end
