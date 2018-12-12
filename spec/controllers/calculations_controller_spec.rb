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
    context 'when data is valid' do
      # let(:calculation) { build_stubbed Calculation }
      let(:calculation_service) { spy(PerformCalculation, success?: true) }
      let(:calculation_serializer) { spy(CalculationSerializer, to_json: {}.to_json) }

      before { allow_any_instance_of(described_class).to receive(:calculation_service).and_return(calculation_service) }
      before { allow_any_instance_of(described_class).to receive(:calculation_serializer).and_return(calculation_serializer) }

      let(:params) do
        { a: '1', b: '2', operator: '+' }
      end
      before { post :create, params: params, format: :json }
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'calls service calculations' do
        expect(calculation_service).to have_received(:new).with(params)
        expect(calculation_service).to have_received(:call)
      end

      it 'serializes response' do
        expect(calculation_serializer).to have_received(:new).with(calculation_service)
        expect(calculation_serializer).to have_received(:to_json)
      end
    end
  end

  context 'when data is invalid' do
    let(:calculation_service) { spy(PerformCalculation, success?: false, messages: ['bad request']) }

    before { allow_any_instance_of(described_class).to receive(:calculation_service).and_return(calculation_service) }

    let(:params) do
      { a: '1', b: '2', operator: 'blah' }
    end
    before { post :create, params: params, format: :json }
    it 'returns http success' do
      expect(response).to have_http_status(:bad_request)
    end

    it 'calls service calculations' do
      expect(calculation_service).to have_received(:new).with(params)
      expect(calculation_service).to have_received(:call)
    end

    it 'responses with errors' do
      response_body = JSON.parse(response.body)
      expect(response_body).to match('errors' => calculation_service.messages)
    end
  end
end
