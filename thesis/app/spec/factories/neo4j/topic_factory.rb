# frozen_string_literal: true

FactoryBot.define do
  factory :neo4j_topic, :class => Neo4j::Topic do
    title Faker::Lorem.words(6).join(' ').capitalize
  end
end
