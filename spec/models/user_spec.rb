require "rails_helper"

RSpec.describe User do
  it { is_expected.to be_an(ApplicationRecord) }

  it { is_expected.to have_secure_password }
end
