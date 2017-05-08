class Api::V1::CompaniesController < ApplicationController
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

  def edit
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
    @company = Company.find(params[:id])
    if @company.destroy
      render json: {companies: @companies}
    else
      render json: {error: 'Not delete.'}
    end
  end

  private
  def company_params
    params.permit(:name, :location)
  end
end
