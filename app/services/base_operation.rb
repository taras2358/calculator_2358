class BaseOperation
  def success(object = nil)
    OperationResult::Success.new(object: object)
  end

  def failure(code, object = nil)
    OperationResult::Failure.new(code: :validation_error, object: object)
  end
end

