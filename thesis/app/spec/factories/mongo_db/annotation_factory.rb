# frozen_string_literal: true

FactoryBot.define do
  factory :mongodb_annotation, :class => MongoDB::Annotation do
    text { Faker::Lorem.words(20).join(' ').capitalize }
  end
end
