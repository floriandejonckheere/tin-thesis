# frozen_string_literal: true

FactoryBot.define do
  factory :topic, :class => Neo4j::Topic do
    title Faker::Lorem.words(6).join(' ').capitalize
    description Faker::Lorem.sentence
  end
end
