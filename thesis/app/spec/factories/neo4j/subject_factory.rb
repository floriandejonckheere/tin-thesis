# frozen_string_literal: true

FactoryBot.define do
  factory :neo4j_subject, :class => Neo4j::Subject do
    first_name { Faker::Name.first_name }
  end
end
