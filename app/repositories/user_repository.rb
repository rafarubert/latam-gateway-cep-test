# frozen_string_literal: true

class UserRepository
  def initialize
    @user = User
  end

  def find_by_email!(email)
    @user.find_by!(email: email)
  end
end
