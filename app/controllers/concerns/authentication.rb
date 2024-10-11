module Authentication
  def require_authentication
    restore_authentication || request_authentication
  end

  def restore_authentication
    Current.user = User.find_by(id: cookies.signed[:user_id])
  end

  def request_authentication
    redirect_to new_session_path, notice: "You must be signed in to perform that action"
  end

  # @param user [User]
  def sign_in(user)
    cookies.signed.permanent[:user_id] = {value: user.id, httponly: true}
  end
end
