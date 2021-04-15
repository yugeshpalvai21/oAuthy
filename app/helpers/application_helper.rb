module ApplicationHelper
  def show_auth_links
    if user_signed_in? 
      "<h4>Signed In As - #{current_user.email}</h4>" +
      "#{link_to "Sign Out", destroy_user_session_path, method: :delete}"
    else 
      "#{link_to 'Sign Up', new_user_registration_path}" + 
      "#{link_to 'Sign In', new_user_session_path}"
     end
  end
end
