require "rails_helper"

RSpec.describe DashboardsController do
  describe "#show" do
    context "when user is signed in" do
      it "is expected to render template show with status ok" do
        user = create(:user, password: "password")

        post session_path, params: {session: {email: user.email, password: "password"}}

        get dashboard_path

        expect(response).to render_template(:show)

        expect(response).to have_http_status(:ok)
      end
    end

    context "when user is not signed in" do
    end

    # it "is expected to render template show with status ok" do
    #   get dashboard_path
    #
    #   expect(response).to render_template(:show)
    #
    #   expect(response).to have_http_status(:ok)
    # end
  end
end
