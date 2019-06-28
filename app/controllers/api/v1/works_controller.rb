class Api::V1::WorksController < BaseController
  before_action :set_work, only: [:add_worker]
  before_action :set_worker, only: [:add_worker]

  def index
    @works = Work.all

    render json: @works
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      render json: @work, status: :created
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  def add_worker
    if @work.workers << @worker
      render json: @work, status: :created
    else
      render json: @work.errors
    end
  end

  private
  def set_work
    @work = Work.find_by(id: params[:id])
    render json: { status: 404, message: 'Work order not found' } if @work.nil?
  end

  def set_worker
    @worker = Worker.find_by(id: params[:worker_id])
    render json: { status: 404, message: 'Worker not found' } if @worker.nil?
  end

  def work_params
    params.require(:work).permit(:title, :description, :deadline)
  end
end
