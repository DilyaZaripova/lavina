class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update]

  def index
    @companies = Company.all

    render json: {companies: @companies}
  end

  def show
    @company = Company.find(params[:id])
    if Company.exists?
      render json: @company
    else
      render json: {
          error: 'Not such record in DataBase, check params',
          status: :not_found,
      }
    end
  end
  #POST
  def new
    @company = Company.new
  end

  def set_company
    @company = Company.find(params[:id])
  end
  #POST
  def create
    @company = Company.new(company_params)

    if @company.save
      render @companies
    else
      render json: {
          error: 'Not such record in DataBase, check params',
          status: :not_found,
      }
    end
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      render json: @company
    else
      render json: {
          error: 'Not update.'
      }
    end
  end
  #DELETE
  def destroy
    id = params[:id]
    @company = Company.find(params[:id])
    #@company.destroy
    #  render json: {companies: @companies}

    if @company.deleted
      render json: {
          deleted_company: [],
          companies: @companies,
      }
    else
      @company.deleted_company
        render json: {
          deleted_company: @company,
          code: 200,
          status: :success,
        }
    end
  end
  #необходимо пометить удаленные(без удаления из базы)

  private
  def company_params
    params.permit(:name, :location)
  end
end
