# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render json: { message: 'CEP API' }
  end
end
