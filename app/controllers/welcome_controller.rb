class WelcomeController < ApplicationController
  def index
    @title = "Home"
    if signed_in?
    @performer_stories = Story.where("performer_id = ?", current_user.id)
    @creator_stories = Story.where("creator_id = ?", current_user.id)
    end
  end
end
