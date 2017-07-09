module UsersHelper
    
  # Returns the Gravatar for the given user.
  def gravatar_for(user, size: 80, default_style: true)
    name = user.nil? ? "Anonymous" : user.name
    default_class = "gravatar" if default_style
    gravatar_id = user.nil? ? "" : Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: name, class: default_class)
  end
end
