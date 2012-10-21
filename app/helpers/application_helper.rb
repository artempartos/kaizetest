module ApplicationHelper
  def title
    @title.present? ?  t('title.base_title') << " | #{@title}" : t('title.base_title')
  end

  def story_state_t(state)
    t("activerecord.state_machines.story.state.states.#{state}")
  end

  def story_event_t(event)
    t("activerecord.state_machines.story.state.events.#{event}")
  end

end
