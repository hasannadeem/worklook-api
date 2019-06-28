require 'rails_helper'

RSpec.describe Work, type: :model do
  it { should have_many(:workers) }
  it { should have_many(:assignments).dependent(:destroy) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:deadline) }

  describe "Check before create callback for deadline" do
    it "should raise exception on passed deadline" do
      work = Work.new(title: "painting", description: "painting job", deadline: Date.today - 10)

      expect{work.save!}.to raise_exception
    end

    it "should not raise any exception on valid future deadline" do
      work = Work.new(title: "painting", description: "painting job", deadline: Date.today + 10)

      expect{work.save!}.not_to raise_exception
    end
  end
end
