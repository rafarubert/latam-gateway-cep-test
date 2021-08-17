# frozen_string_literal: true

class AuthenticationService
  def initialize
    @authentication_validation = AuthenticationValidation.new
    @user_repository = UserRepository.new
    @create_token_service = CreateTokenService.new
  end

  def call(user_vo)
    invalid_credentials_error = AuthenticationError.new('Invalid Credentials', :unauthorized)
    @authentication_validation.validate(user_vo)

    user = begin
      @user_repository.find_by_email!(user_vo.email)
    rescue ActiveRecord::RecordNotFound
      raise(invalid_credentials_error)
    end

    raise(invalid_credentials_error) unless user.authenticate(user_vo.password)

    @create_token_service.call(user)
  end
end
