# frozen_string_literal: true

FactoryBot.define do
  factory :annotation, :class => Neo4j::Annotation do
    text Faker::Lorem.sentence
  end
end
