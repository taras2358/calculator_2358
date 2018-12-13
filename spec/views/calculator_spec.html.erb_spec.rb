# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'calculations/new', type: :view, js: true do
  describe 'calculation', type: :feature do
    before { visit root_path }
    context 'when data filled correctly' do
      it 'returns result' do
        fill_in 'A', with: 2
      end
    end
  end
end

