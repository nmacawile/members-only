module ApplicationHelper	
  def generate_title(title)
  	app_name = "Members Only!"
    return app_name if title.blank?
    "#{title} | #{app_name}"
  end

end
