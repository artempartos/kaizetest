module ApplicationHelper
  def title
    base_title = "Simple Task Manager"
    @title.present? ?  "#{base_title} | #{@title}" : base_title
  end
end
