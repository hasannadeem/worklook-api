require 'rails_helper'

RSpec.describe Worker, type: :model do
  it { should have_many(:works) }
  it { should have_many(:assignments).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
