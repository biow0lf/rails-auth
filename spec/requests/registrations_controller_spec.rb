require "rails_helper"

RSpec.describe RegistrationsController do
  describe "#new" do
    it "is expected to render template new with status ok" do
      get new_registration_path

      expect(response).to render_template(:new)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "#create" do
    it "is expected to create user and redirect to dashboard" do
      expect do
        post registration_path, params: {user: {email: "me@example.com", password: "password"}}
      end.to change(User, :count).by(1)

      expect(response).to redirect_to(dashboard_path)

      expect(flash[:notice]).to eq("You have successfully registered!")
    end
  end
end
