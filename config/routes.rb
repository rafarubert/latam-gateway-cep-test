# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  post '/sign_in' => 'sessions#sign_in'
end
