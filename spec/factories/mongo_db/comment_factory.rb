# frozen_string_literal: true

FactoryBot.define do
  factory :mongodb_comment, :class => MongoDB::Comment do
    text { Faker::Lorem.words(20).join(' ').capitalize }
  end
end
