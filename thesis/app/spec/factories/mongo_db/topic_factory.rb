# frozen_string_literal: true

FactoryBot.define do
  factory :mongodb_topic, :class => MongoDB::Topic do
    title { Faker::Lorem.words(6).join(' ').capitalize }
  end
end
