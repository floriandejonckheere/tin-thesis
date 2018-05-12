# frozen_string_literal: true

FactoryBot.define do
  factory :mongodb_event, :class => MongoDB::Event do
    predicate { %i[created updated renamed commented annotated reacted].sample }
  end
end
