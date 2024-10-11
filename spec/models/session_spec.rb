require "rails_helper"

RSpec.describe Session do
  it { is_expected.to be_an(ApplicationRecord) }

  it { is_expected.to belong_to(:user) }
end
