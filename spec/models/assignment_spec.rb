require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it { should belong_to(:worker) }
  it { should belong_to(:work) }
end
