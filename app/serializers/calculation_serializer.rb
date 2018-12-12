# frozen_string_literal: true

class CalculationSerializer
  attr_reader :record
  def initialize(record)
    @record = record
  end

  def to_json(_params)
    { calculation: serialized_calculation }.to_json
  end

  private

  def serialized_calculation
    { operation: operation,
      result: result,
      id: record.id,
      count: record.count }
  end

  def operation
    [record.a, record.operator, record.b].join(' ')
  end

  def result
    record.result.round(10)
  end
end
