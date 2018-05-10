class ApplicationController < ActionController::API
  include Response
  # include ActionController::Serialization

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end

  before_action :authenticate_request
   attr_reader :current_user

   private

   def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not today, Satan.' }, status: 401 unless @current_user
  end
end
