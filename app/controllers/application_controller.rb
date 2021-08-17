# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ApiError, with: :request_error

  def request_error(exception)
    render json: ErrorSerializer.new(
      exception.message,
      exception.http_status
    ), status: exception.http_status
  end
end
