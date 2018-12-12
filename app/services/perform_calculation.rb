class PerformCalculation < BaseOperation
  attr_reader :params, :form
  def initialize(params)
    @params = params
  end

  def call
    initialize_form
    validate_form

    return failure(:validation_error, form) unless valid_form?

    # create_user
    success(Calculation.first)
  end

  private

  def initialize_form
    @form = form_class.new(params)
  end

  def validate_form
    form.validate
  end

  def valid_form?
    form.errors.blank?
  end

  def form_class
    CalculatorForm
  end
end
