require "rails_helper"

RSpec.describe RegistrationsController do
  describe "#new" do
    it "is expected to render template new with status ok" do
      get new_registration_path

      expect(response).to render_template(:new)

      expect(response).to have_http_status(:ok)
    end
  end
end
