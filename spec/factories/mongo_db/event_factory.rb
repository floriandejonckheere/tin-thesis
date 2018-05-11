# frozen_string_literal: true

FactoryBot.define do
  factory :mongodb_event, :class => MongoDB::Event do
    %i[created updated renamed commented annotated reacted].sample do |pred|
      predicate pred

      association :subject,
                  :factory => :mongodb_subject

      case pred
      when :created
      when :updated
      when :renamed
      when :commented
      when :annotated
      when :reacted
      else
      end
    end
  end
end
