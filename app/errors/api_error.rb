# frozen_string_literal: true

class ApiError < StandardError
  attr_reader :http_status

  def initialize(msg = 'API Error', http_status = 500)
    @http_status = http_status
    super(msg)
  end
end
