class CalculatorForm
  include ActiveModel::Model

  # def initialize(params)
    # params = params.slice(:a, :b, :operation)
    # super
  # end

  attr_accessor(
    :a,
    :b,
    :operation
  )

  validates :a, presence: true
  validates :b, presence: true
  validates :operation, presence: true

  # validate :email_uniqueness

  def email_uniqueness
    User::Repository.find_by(email: email)
  end
end

