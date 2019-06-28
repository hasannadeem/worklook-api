class Api::V1::WorkersController < BaseController
  before_action :set_work, only: [:destroy, :get_works]

  def index
    @workers = Worker.all

    render json: @workers
  end

  def create
    @worker = Worker.new(worker_params)

    if @worker.save
      render json: @worker, status: :created
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @worker.destroy
      render nothing: true, status: 201
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  def get_works
    ordered_works = @worker.works.order(:deadline)
    render json: ordered_works
  end

  private
    def set_work
      @worker = Worker.find_by(id: params[:id])
      render json: { status: 404, message: 'Worker not found' } if @worker.nil?
    end

    def worker_params
      params.require(:worker).permit(:name, :company_name, :email)
    end
end
