# frozen_string_literal: true

FactoryBot.define do
  factory :neo4j_annotation, :class => Neo4j::Annotation do
    text Faker::Lorem.sentence
  end
end
