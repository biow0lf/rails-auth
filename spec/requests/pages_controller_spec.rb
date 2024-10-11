require "rails_helper"

RSpec.describe PagesController do
  describe "#home" do
    it "is expected to render template home with status ok" do
      get root_path

      expect(response).to render_template(:home)

      expect(response).to have_http_status(:ok)
    end
  end
end
