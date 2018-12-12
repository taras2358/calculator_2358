# frozen_string_literal: true

class CalculationsController < ApplicationController
  def new
    # New
  end

  def create
    calculator = PerformCalculation.new(calculation_params)
    result = calculator.call

    if result.success?
      render json: calculation_serializer.new(result.object)
    else
      render json: { errors: result.object.errors.messages }, status: :bad_request
    end
  end

  protected

  def calculation_params
    params.permit(:a, :b, :operation)
  end

  def calculation_serializer
    CalculationSerializer
  end
end
