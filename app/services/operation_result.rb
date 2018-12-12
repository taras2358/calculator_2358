class OperationResult
  def success?
    false
  end

  def failure?
    false
  end

  class Success < OperationResult
    attr_reader :object, :code
    def initialize(code: :success, object:)
      @object = object
      @code = code
    end

    def success?
      true
    end
  end

  class Failure < OperationResult
    attr_reader :code, :object

    def initialize(code:, object:)
      @code = code
      @object = object
    end

    def failure?
      true
    end
  end
end

