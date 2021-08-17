# frozen_string_literal: true

class AuthenticationService
  def initialize
    @authentication_validation = AuthenticationValidation.new
    @user_repository = UserRepository.new
    @create_token_service = CreateTokenService.new
  end

  def call(user)
    @authentication_validation.validate(user)

    user = @user_repository.find_by_email!(user.email)

    AuthenticationError.new('Invalid credentials', :unauthorized) unless user.authenticate(user.password)

    @create_token_service.call(user)
  end
end
