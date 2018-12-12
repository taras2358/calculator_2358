# frozen_string_literal: true

class BaseOperation
  def success(object = nil)
    OperationResult::Success.new(object: object)
  end

  def failure(code, object = nil)
    OperationResult::Failure.new(code: code, object: object)
  end
end
