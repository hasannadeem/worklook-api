require 'rails_helper'

RSpec.describe Api::V1::WorkersController, type: :controller do
  let(:painter) { create(:worker) }
  let(:mason) { create(:worker) }
  let(:paint_job) { create(:work, title: "paint") }
  let(:car_job) { create(:work, title: "mechanical") }
  let(:valid_attributes) do
    {
      name: 'usman asif',
      company_name: 'google',
      email: 'mail.usmanasif@gmail.com'
    }
  end

  before do
    painter.reload
    mason.reload
    paint_job.reload
    car_job.reload
  end

  describe "GET #index" do
    it "return all workers" do
      get :index, format: :json

      expect(JSON.parse(response.body).count).to eq(2)
    end
  end

  describe "POST #create" do
    it "should create a new worker" do
      post :create, params: { worker: valid_attributes }, format: :json

      expect(JSON.parse(response.body)["id"]).not_to be_nil
    end
  end

  describe "DELETE #destroy" do
    it "should destroy the last worker" do
      last_worker_id = Worker.last.id
      delete :destroy, params: {id: last_worker_id}, format: :json

      expect(Worker.last.id).not_to be(last_worker_id)
    end
  end

  describe "GET #get_works" do
    it "return all work orders of last worker" do
      Worker.last.works << paint_job
      Worker.last.works << car_job
      get :get_works, params: {id: Worker.last.id}, format: :json

      expect(JSON.parse(response.body).count).to eq(2)
    end
  end
end
