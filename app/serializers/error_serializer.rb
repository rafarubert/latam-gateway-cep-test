# frozen_string_literal: true

class ErrorSerializer
  attr_reader :message, :http_status

  def initialize(message, http_status)
    @message = message
    @status = http_status
  end

  def as_json(_options = nil)
    {
      error: @status,
      message: @message,
      status: Rack::Utils::SYMBOL_TO_STATUS_CODE[@status]
    }
  end
end
