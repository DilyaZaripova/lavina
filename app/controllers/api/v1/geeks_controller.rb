class Api::V1::GeeksController < ApplicationController
  before_action :set_geek, only: [:show, :update]
  def index
    @geek = Geek.all

    render json: {geeks: @geeks}
  end

  def show
    @geek = Geek.find(params[:id])
    if Geek.exists?
      render json: @geek
    else
      render json: {
          error: 'Not such record in DataBase, check params',
          status: :not_found,
      }
    end
  end
  #POST
  def new
    @geek = Geek.new
  end

  def edit
    @geek = Geek.find(params[:id])
  end
  #POST
  def create
    @geek = Geek.new(geek_params)

    if @geek.save
      render @geeks
    else
      render json: {
          error: 'Not such record in DataBase, check params',
          status: :not_found,
      }
    end
  end

  def update
    @geek = Geek.find(params[:id])

    if @geek.update(geek_params)
      render json: @geek
    else
      render json: {
          error: 'Not update.'
      }
    end
  end
  #DELETE
  def destroy
    @geek = Geek.find(params[:id])
    if @geek.destroy
      render json: {geeks: @geeks}
    else
      render json: {error: 'Not delete.'}
    end
  end

  private
  def geek_params
    params.permit(:name, :stack, :resume)
  end
end
