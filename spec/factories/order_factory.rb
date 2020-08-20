# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    client { 'João da Silva' }
    sequence(:tracking) { |n| "PY761435#{n}75BR" }
    sequence(:code) { |n| "#{n}99738SP" }
    status_cd { 0 }
  end
end
