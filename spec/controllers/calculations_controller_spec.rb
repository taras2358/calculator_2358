# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculationsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      # get :create
      # expect(response).to have_http_status(:success)
    end
  end
end