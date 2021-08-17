# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'columns' do
    context 'when have the necessary columns' do
      it { is_expected.to have_db_column(:email) }
      it { is_expected.to have_db_column(:password_digest) }
    end

    context 'when use has_secure_password' do
      it { is_expected.to have_secure_password }
    end
  end
end
