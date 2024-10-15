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
end
