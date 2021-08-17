# frozen_string_literal: true

class UserVo
  attr_reader :email, :password

  def initialize(email:, password:)
    @email = email
    @password = password
  end
end
