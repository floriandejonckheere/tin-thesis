# frozen_string_literal: true

FactoryBot.define do
  factory :mongodb_comment, :class => MongoDB::Comment do
    text { Faker::Lorem.words(20).join(' ').capitalize }

    association :topic,
                :factory => :mongodb_topic

    association :subject,
                :factory => :mongodb_subject
  end
end
