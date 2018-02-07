class ApplicationController < ActionController::API
  rescue_from Exception, with: :render_error

  def routing_catch_all
    raise ActionController::RoutingError.new("Route not found: `/#{params[:path]}`")
  end

  protected

  def render_error(error)
    message = error.message

    case error
    when ActionController::RoutingError, ActiveRecord::RecordNotFound
      code = 404
    when ActiveRecord::ActiveRecordError, ActionController::ParameterMissing
      code = 400
    else
      code = 500
      message = 'Something went wrong.'
    end

    logger.debug "\n#{error.class}: #{error.message}\n"

    render json: {
      error: {
        message: message,
        code: code
      }
    }
  end

  def render_result(result = {})
    render json: {
      result: result
    }
  end
end
