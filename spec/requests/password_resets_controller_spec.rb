require "rails_helper"

RSpec.describe PasswordResetsController do
  describe "#new" do
    context "when user is not signed in" do
      it "is expected to render template new with status ok" do
        get new_password_reset_path

        expect(response).to render_template(:new)

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "#create" do
    context "when user us not signed in" do
      it "is expected to redirect to root path" do
        user = create(:user)

        expect do
          post password_reset_path, params: {email: user.email}
        end.to have_enqueued_mail(UserMailer, :password_reset)

        expect(response).to redirect_to(root_path)

        expect(flash[:notice]).to eq("Email sent with password reset instructions")
      end
    end
  end
end
