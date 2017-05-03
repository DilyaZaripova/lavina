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
end
