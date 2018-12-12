# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'calculations#new'
  resources :calculations, only: %i[new create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
