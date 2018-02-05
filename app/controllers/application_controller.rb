class ApplicationController < ActionController::API
  protected

  def render_result(result = { success: true })
    render json: { result: result }
  end
end
