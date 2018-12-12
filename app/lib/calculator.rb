# frozen_string_literal: true

class Calculator
  attr_reader :a, :b, :operator
  def initialize(a:, b:, operator:)
    @a = BigDecimal(a)
    @b = BigDecimal(b)
    @operator = operator
  end

  # Allow calculator to raise exception in case of invalid data
  # as this logic is implemented inside form
  def calculate
    a.public_send(operator, b)
  # rescue ZeroDivisionError => e
  end
end
