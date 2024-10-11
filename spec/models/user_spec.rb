require "rails_helper"

RSpec.describe User do
  it { is_expected.to be_an(ApplicationRecord) }

  it { is_expected.to have_secure_password }

  it { is_expected.to validate_presence_of(:password).on(:create) }

  it { is_expected.to validate_length_of(:password).is_at_least(8) }

  it { is_expected.to validate_presence_of(:email) }

  describe "email uniq validations" do
    subject { create(:user, password: "password", password_digest: nil) }

    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
