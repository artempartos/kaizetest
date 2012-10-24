module TitleHelper
  def title_translate
    scope = [:title, :controllers]
    scope += params[:controller].split('/')
    key = params[:action]
    t(key, :scope => scope)
  end
end
