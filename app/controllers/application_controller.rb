class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :render_response_unprocessable_entity
rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found

private
def render_response_not_found
    render json: {error: "CANT FIND THAT YO"}, status: :not_found
end

def render_response_unprocessable_entity invalid
    render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
end
end
