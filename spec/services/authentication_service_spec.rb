# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticationService do
  subject(:authentication_service) { described_class.new.call(user_vo) }

  describe '.call' do
    context 'with valid user' do
      let(:user) { create(:user, password: '123456') }
      let(:user_vo) do
        UserVo.new(
          email: user.email,
          password: '123456'
        )
      end

      it 'returns token' do
        expect(authentication_service).to eq 'xyz'
      end
    end

    context 'without valid user' do
      let(:error_object) { { message: 'Unprocessable Entity' } }

      let(:user_vo) do
        UserVo.new(
          email: '',
          password: ''
        )
      end

      it 'raise invalid user' do
        expect { authentication_service }.to raise_error(
          an_instance_of(AuthenticationError).and(having_attributes(error_object))
        )
      end
    end

    context 'with invalid password' do
      let(:error_object) { { message: 'Invalid Credentials' } }

      let(:user) { create(:user, password: '123456') }
      let(:user_vo) do
        UserVo.new(
          email: user.email,
          password: '123'
        )
      end

      it 'raise invalid password' do
        expect { authentication_service }.to raise_error(
          an_instance_of(AuthenticationError).and(having_attributes(error_object))
        )
      end
    end

    context 'with invalid email' do
      let(:error_object) { { message: 'Invalid Credentials' } }

      let(:user) { create(:user, password: '123456') }
      let(:user_vo) do
        UserVo.new(
          email: 'invalid@example.com',
          password: '123456'
        )
      end

      it 'raise invalid password' do
        expect { authentication_service }.to raise_error(
          an_instance_of(AuthenticationError).and(having_attributes(error_object))
        )
      end
    end
  end
end
