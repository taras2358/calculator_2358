# frozen_string_literal: true

FactoryBot.define do
  factory :calculation do
    a { 4 }
    b { 3 }
    operator { '+' }
    count { 1 }
  end
end
