# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PerformCalculation, type: :service do
  let(:params) do
    { a: '1', b: '2', operator: '+' }
  end
  let(:described_instance) { described_class.new(params) }
  subject { described_instance.call }

  describe '#call' do
    context 'when data is invalid' do
      # Stub this flow, as its detailed check is done into Form spec
      let(:form) { spy(CalculatorForm, errors: ['Incorrect data']) }
      before { allow(described_instance).to receive(:form_class).and_return(form) }

      it { is_expected.to be_failure }

      it 'returns validation errors' do
        expect(subject.code).to eq :validation_error
      end
    end

    context 'when such calculation was already done' do
      let!(:calculation) { create :calculation, result: 3, **params }

      it { is_expected.to be_success }

      it 'returns existing calculation' do
        expect(subject.object).to eq calculation
      end

      it 'increments existing calculation usage count' do
        expect { subject }.to change { calculation.reload.count }.by(1)
      end
    end

    context 'when such calculation does not exist in db' do
      let(:calculator) { spy(Calculator, calculate: 2313) }
      before { allow(described_instance).to receive(:calculator_class).and_return(calculator) }
      it { is_expected.to be_success }

      it 'calls calculator for result calculation' do
        subject
        expected_params = { a: params[:a].to_i, b: params[:b].to_i, operator: params[:operator] }
        expect(calculator).to have_received(:new).with(expected_params)
      end

      it 'creates valid calculation object' do
        expect { subject }.to change { Calculation.count }.by(1)
        calculation = subject.object
        expect(calculation.a).to eq(params[:a].to_i)
        expect(calculation.b).to eq(params[:b].to_i)
        expect(calculation.operator).to eq(params[:operator])
        expect(calculation.result).to eq(calculator.calculate)
      end
    end
  end
end
