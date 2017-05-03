class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    render json: {
        error: 'Not such record in DataBase; check params',
        status: :not_found,
    }
  end
end
