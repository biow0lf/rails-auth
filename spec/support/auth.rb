module Auth
  # @param user [User]
  def _sign_in(user)
    post session_path, params: {session: {email: user.email, password: "password"}}
  end
end

RSpec.configure do |config|
  config.include Auth, type: :request
end
