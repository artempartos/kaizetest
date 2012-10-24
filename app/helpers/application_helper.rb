module ApplicationHelper
  def title
    @title.present? ?  t('title.base_title') << " | #{@title}" : t('title.base_title')
  end

end
