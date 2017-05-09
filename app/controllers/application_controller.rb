class ApplicationController < ActionController::API
  def catch_404
    raise ActionController::RoutingError.new(params[:path])
  end

  rescue_from ActionController::RoutingError do |exception|
    logger.error "Routing error occurred: #{exception}"
    # render plain: '404 Not found', status: 404
    render json: { error: 'No route matches; check routes',
                   status: :no_route,
    }
  end
end
