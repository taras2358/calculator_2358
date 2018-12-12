# frozen_string_literal: true

class Calculation < ApplicationRecord
  OPERATIONS = %w[+ - * /].freeze

  # Find calcution by its details
  # Check case when order of arguments (a, b) does not matter
  def self.find_by_operation(operation)
    case operation[:operator]
    when '+', '*'
      a = operation[:a]
      b = operation[:b]
      Calculation.find_by(a: [a, b], b: [a, b], operator: operation[:operator])
    else
      Calculation.find_by(operation)
    end
  end
end
