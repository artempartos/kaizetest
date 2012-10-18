module AccessHelper
include AuthHelper
  def creator?(story)
    current_user.id == story.creator_id
  end

  def performer?(story)
    current_user.id == story.performer_id
  end
end

