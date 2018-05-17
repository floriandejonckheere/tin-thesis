# frozen_string_literal: true

FactoryBot.define do
  factory :neo4j_comment, :class => Neo4j::Comment do
    text { Faker::Lorem.sentences(3).join ' ' }
  end
end
