# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /index' do
    context 'with default message' do
      before do
        get '/'
      end

      it { expect(JSON.parse(response.body)['message']).to eq 'CEP API' }
    end
  end
end
