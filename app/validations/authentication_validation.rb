# frozen_string_literal: true

class AuthenticationValidation
  def validate(user)
    validates_user_type user
    validates_params user
  end

  private

  def call_error(message, status_code)
    raise(AuthenticationError.new(message, status_code))
  end

  def validates_user_type(user)
    call_error('Internal server error', :internal_server_error) unless user.instance_of? UserVo
  end

  def validates_params(user)
    call_error('Unprocessable Entity', :unprocessable_entity) if user.email.blank? || user.password.blank?
  end
end
