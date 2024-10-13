require "rails_helper"

RSpec.describe DashboardsController do
  describe "#show" do
    context "when user is signed in" do
      it "is expected to render template show with status ok" do
        user = create(:user, :with_default_password)

        _sign_in(user)

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
