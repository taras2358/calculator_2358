# frozen_string_literal: true

class CalculatorForm
  include ActiveModel::Model

  attr_accessor(
    :a,
    :b,
    :operator
  )

  validates :a, presence: true,
                numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 100 }
  validates :b, presence: true,
                numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 100 }
  validates :operator, presence: true, inclusion: Calculation::OPERATORS

  validate :zero_division, if: ->(form) { form.operator == '/' }

  def zero_division
    errors.add(:b, 'Imposible division argument') if b.to_i.zero?
  end

  # Serialize form for next operations
  def serialize
    { a: a.to_i, b: b.to_i, operator: operator }
  end
end
