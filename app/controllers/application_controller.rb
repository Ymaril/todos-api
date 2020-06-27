class ApplicationController < ActionController::API
  private

  def render_404
    render json: {errors: ['not-found']}.to_json, status: 404
  end
end
