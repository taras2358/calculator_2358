# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Calculator, type: :service do
  describe '#calculate' do
    Calculation::OPERATORS.each do |operator|
      it "calculates two integer #{operator} correctly" do
        params = { a: 4, b: 2, operator: operator }
        a = BigDecimal(params[:a])
        b = BigDecimal(params[:b])
        expected_result = a.public_send(operator, b)
        subject = described_class.new(params).calculate
        expect(subject).to eq expected_result
      end
    end
  end
end
