require "rails_helper"

RSpec.describe SessionsController do
  describe "#new" do
    context "when user is not signed in" do
      it "is expected to render template new with status ok" do
        get new_session_path

        expect(response).to render_template(:new)

        expect(response).to have_http_status(:ok)
      end
    end

    context "when user is signed in" do
      it "is expected to redirect to root path" do
        user = create(:user, :with_default_password)

        _sign_in(user)

        get new_session_path

        expect(response).to redirect_to(root_path)

        expect(flash[:notice]).to eq("You are already signed in")
      end
    end
  end
end
