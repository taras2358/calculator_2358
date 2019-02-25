# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Calculation, type: :model do
  describe '#find_by_operation' do
    it 'returns correct object' do
      create :calculation, operator: '+'
      create :calculation, operator: '-'
      calculation = create :calculation, a: 43, operator: '*'
      subject = described_class.find_by_operation(a: calculation.b, b: calculation.a, operator: calculation.operator)
      expect(subject).to eq calculation
    end

    describe 'reverse argument case' do
      context 'when arguments order does not matter' do
        let(:calculation) { create :calculation, operator: '+' }
        subject { described_class.find_by_operation(a: calculation.b, b: calculation.a, operator: calculation.operator) }
        it 'returns object with reverse attributes' do
          expect(subject).to eq(calculation)
        end
      end
      context 'when arguments order does not matter' do
        let(:calculation) { create :calculation, operator: '-' }
        subject { described_class.find_by_operation(a: calculation.b, b: calculation.a, operator: calculation.operator) }
        it 'does not return object with reverse attributes' do
          expect(subject).to eq(nil)
        end
      end
    end
  end
end
