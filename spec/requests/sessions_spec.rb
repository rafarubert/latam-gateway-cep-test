# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'POST /signin' do
    let(:user) { create(:user, password: '123456') }

    context 'with correct credentials' do
      before do
        post '/sign_in', params: {
          email: user.email,
          password: '123456'
        }
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns token' do
        expect(JSON.parse(response.body)['token']).to be_present
      end
    end

    context 'with invalid credentials' do
      let(:error_object) do
        {
          'error' => 'unprocessable_entity',
          'message' => 'Unprocessable Entity',
          'status' => 422
        }
      end

      before do
        post '/sign_in'
      end

      it 'returns stauts 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error message' do
        expect(
          JSON.parse(response.body)
        ).to eq(error_object)
      end
    end

    context 'with invalid password' do
      let(:error_object) do
        {
          'error' => 'unauthorized',
          'message' => 'Invalid Credentials',
          'status' => 401
        }
      end

      before do
        post '/sign_in', params: {
          email: user.email,
          password: '123'
        }
      end

      it 'returns stauts 401' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns error message' do
        expect(
          JSON.parse(response.body)
        ).to eq(error_object)
      end
    end

    context 'without password' do
      let(:error_object) do
        {
          'error' => 'unprocessable_entity',
          'message' => 'Unprocessable Entity',
          'status' => 422
        }
      end

      before do
        post '/sign_in', params: {
          email: user.email
        }
      end

      it 'returns stauts 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error message' do
        expect(
          JSON.parse(response.body)
        ).to eq(error_object)
      end
    end

    context 'without email' do
      let(:error_object) do
        {
          'error' => 'unprocessable_entity',
          'message' => 'Unprocessable Entity',
          'status' => 422
        }
      end

      before do
        post '/sign_in', params: {
          password: '123456'
        }
      end

      it 'returns stauts 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error message' do
        expect(
          JSON.parse(response.body)
        ).to eq(error_object)
      end
    end

    context 'with empty password' do
      let(:error_object) do
        {
          'error' => 'unprocessable_entity',
          'message' => 'Unprocessable Entity',
          'status' => 422
        }
      end

      before do
        post '/sign_in', params: {
          email: user.email,
          password: ''
        }
      end

      it 'returns stauts 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error message' do
        expect(
          JSON.parse(response.body)
        ).to eq(error_object)
      end
    end
  end

  context 'with empty email' do
    let(:error_object) do
      {
        'error' => 'unprocessable_entity',
        'message' => 'Unprocessable Entity',
        'status' => 422
      }
    end

    before do
      post '/sign_in', params: {
        email: '',
        password: '123456'
      }
    end

    it 'returns stauts 422' do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error message' do
      expect(
        JSON.parse(response.body)
      ).to eq(error_object)
    end
  end

  context 'without valid email' do
    let(:error_object) do
      {
        'error' => 'unauthorized',
        'message' => 'Invalid Credentials',
        'status' => 401
      }
    end

    before do
      post '/sign_in', params: {
        email: 'error@error.com',
        password: '123456'
      }
    end

    it 'returns stauts 401' do
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns error message' do
      expect(
        JSON.parse(response.body)
      ).to eq(error_object)
    end
  end
end
