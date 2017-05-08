class Api::V1::JobsController < ApplicationController
  def index
    @jobs = Job.all

    render json: {jobs: @jobs}
  end

  def show
    @job = Job.find(params[:id])
    if Job.exists?
      render json: @job
    else
      render json: {
          error: 'Not such record in DataBase, check params',
          status: :not_found,
      }
    end
  end
  #POST
  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end
  #POST
  def create
    @job = Job.new(job_params)

    if @job.save
      render @jobs
    else
      render json: {
          error: 'Not such record in DataBase, check params',
          status: :not_found,
      }
    end
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      render json: @job
    else
      render json: {
          error: 'Not update.'
      }
    end
  end
  #DELETE
  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
    render json: {jobs: @jobs}
    else
      render json: {error: 'Not delete.'}
    end
  end

  private
  def job_params
    params.permit(:name, :place, :company_id)
  end

end
