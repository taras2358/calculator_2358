# frozen_string_literal: true

class PerformCalculation < BaseOperation
  attr_reader :params, :calculation
  def initialize(params)
    @params = params
  end

  def call
    initialize_form
    validate_form

    return failure(:validation_error, @form) unless valid_form?

    find_calculation
    if calculation.present?
      calculation.increment!(:count)

      return success(calculation)
    end

    calculation_result = calculate
    persist_calculation(calculation_result)
    success(calculation)
  end

  private

  def initialize_form
    @form = form_class.new(params)
  end

  def validate_form
    @form.validate
  end

  def valid_form?
    @form.errors.blank?
  end

  def find_calculation
    @calculation = Calculation.find_by_operation(@form.serialize)
  end

  def calculate
    Calculator.new(@form.serialize).calculate
  end

  def persist_calculation(result)
    calculation_params = @form.serialize.merge(result: result, count: 1)

    @calculation = Calculation.new(calculation_params)
    @calculation.save
  end

  def form_class
    CalculatorForm
  end
end
