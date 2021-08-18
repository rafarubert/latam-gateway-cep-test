# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticationValidation do
  subject(:authentication_validation) { described_class.new.validate(user_vo) }

  describe '.call' do
    context 'with valid VO' do
      let(:user_vo) { UserVo.new(email: 'valid@example.com', password: '123456') }

      it 'don\'t raise error' do
        expect { authentication_validation }.not_to raise_error
      end
    end

    context 'without valid VO' do
      let(:error_object) { { message: 'Internal server error' } }
      let(:user_vo) { OpenStruct.new(email: 'valid@example.com', password: '123456') }

      it 'don\'t raise error' do
        expect { authentication_validation }.to raise_error(
          an_instance_of(AuthenticationError).and(having_attributes(error_object))
        )
      end
    end

    context 'with empty email' do
      let(:error_object) { { message: 'Unprocessable Entity' } }
      let(:user_vo) { UserVo.new(email: '', password: '123456') }

      it 'don\'t raise error' do
        expect { authentication_validation }.to raise_error(
          an_instance_of(AuthenticationError).and(having_attributes(error_object))
        )
      end
    end

    context 'with empty password' do
      let(:error_object) { { message: 'Unprocessable Entity' } }
      let(:user_vo) { UserVo.new(email: 'valid@example.com', password: '') }

      it 'don\'t raise error' do
        expect { authentication_validation }.to raise_error(
          an_instance_of(AuthenticationError).and(having_attributes(error_object))
        )
      end
    end
  end
end
