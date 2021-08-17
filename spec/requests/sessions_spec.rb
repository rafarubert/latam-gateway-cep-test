# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'POST /signin' do
    context 'with correct credentials' do
      let(:user) { create(:user) }

      before do
        post '/sign_in', params: {
          email: user.email,
          password: user.password
        }
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns token' do
        expect(JSON.parse(response.body)['token']).to be_present
      end
    end
  end
end
