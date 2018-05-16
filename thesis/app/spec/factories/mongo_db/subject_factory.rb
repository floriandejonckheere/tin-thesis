# frozen_string_literal: true

FactoryBot.define do
  factory :mongodb_subject, :class => MongoDB::Subject do
    first_name { Faker::Name.first_name }
  end
end
