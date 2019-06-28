require 'rails_helper'

RSpec.describe Api::V1::WorksController, type: :controller do
  let(:painter) { create(:worker) }
  let(:mason) { create(:worker) }
  let(:paint_job) { create(:work, title: "paint") }
  let(:car_job) { create(:work, title: "mechanical") }
  let(:valid_attributes) do
    {
      title: 'car works',
      description: Faker::Lorem.paragraph(2),
      deadline: Date.today + 5
    }
  end

  before do
    painter.reload
    mason.reload
    paint_job.reload
    car_job.reload
  end

  describe "GET #index" do
    it "return all works" do
      get :index, format: :json

      expect(JSON.parse(response.body).count).to eq(2)
    end
  end

  describe "POST #create" do
    it "should create a new work order" do
      post :create, params: { work: valid_attributes }, format: :json

      expect(JSON.parse(response.body)["id"]).not_to be_nil
    end
  end

  describe "POST #add_worker" do
    it "should add users in last work order" do
      post :add_worker, params: {id: Work.last.id, worker_id: painter.id }, format: :json

      expect(Work.last.workers.find(painter.id)).not_to be_nil
    end
  end
end
