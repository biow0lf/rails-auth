require "rails_helper"

RSpec.describe DashboardsController do
  describe "#show" do
    it "is expected to render template show with status ok" do
      get dashboard_path

      expect(response).to render_template(:show)

      expect(response).to have_http_status(:ok)
    end
  end
end
