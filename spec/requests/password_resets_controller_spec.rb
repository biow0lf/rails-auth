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

  describe "#edit" do
    context "when user is not signed in" do
      it "is expected to render template new with status ok" do
        get edit_password_reset_path

        expect(response).to render_template(:edit)

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "#update" do
    context "when user is not signed in" do
      it "is expected to redirect to dashboard path" do
        user = create(:user)

        token = user.generate_token_for(:password_reset)

        patch password_reset_path, params: {
          password_reset_token: token,
          password_reset: {
            password: "newpassword",
            password_confirmation: "newpassword"
          }
        }

        expect(response).to redirect_to(dashboard_path)

        expect(flash[:notice]).to eq("Password has been successfully reset")

        get dashboard_path

        expect(response).to render_template(:show)

        expect(response).to have_http_status(:ok)

        expect(user.reload.authenticate("newpassword")).to eq(user)
      end
    end
  end
end
