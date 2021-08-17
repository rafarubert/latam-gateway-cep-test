# frozen_string_literal: true

class SessionsController < ApplicationController
  def sign_in
    user_vo = UserVo.new(
      email: permited_params['email'],
      password: permited_params['password']
    )

    token = AuthenticationService.new.call(user_vo)

    render json: { token: token }
  end

  private

  def permited_params
    params.permit(:email, :password)
  end
end
