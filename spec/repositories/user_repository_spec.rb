# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserRepository do
  subject(:user_repository) { described_class.new }

  describe '#find_by_email!' do
    context 'with valid email' do
      let(:user) { create(:user) }

      it 'returns valid user' do
        expect(user_repository.find_by_email!(user.email).email).to eq user.email
      end
    end

    context 'with ivalid email' do
      let(:error_object) { { message: 'Couldn\'t find User' } }

      it 'raise error' do
        expect { user_repository.find_by_email!('examle@example.com') }.to raise_error(
          an_instance_of(ActiveRecord::RecordNotFound).and(having_attributes(error_object))
        )
      end
    end
  end
end
