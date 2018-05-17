# frozen_string_literal: true

FactoryBot.define do
  factory :subject, :class => Neo4j::Subject do
    first_name Faker::Name.first_name
  end
end
