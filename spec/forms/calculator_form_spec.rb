# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculatorForm, type: :model do
  it { should validate_presence_of(:a) }
  it { should validate_presence_of(:b) }
  it { should validate_presence_of(:operation) }

  it { is_expected.not_to allow_value('blah').for(:operation) }

  %i[a b].each do |field|
    it { is_expected.not_to allow_value(-1).for(field) }
    it { is_expected.not_to allow_value(100).for(field) }
    it { is_expected.not_to allow_value(1.2).for(field) }

    it { is_expected.to allow_value(0).for(field) }
    it { is_expected.to allow_value(99).for(field) }
  end
end
