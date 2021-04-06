module ApplicationHelper
  def show_auth_links
    if user_signed_in? 
      "<h4>Signed In As - #{current_user.username}</h4>" +
      "#{link_to "Sign Out", sign_out_path}"
    else 
      "#{link_to 'Sign Up', sign_up_path}" + 
      "#{link_to 'Sign In', sign_in_path}"
     end
  end
end
