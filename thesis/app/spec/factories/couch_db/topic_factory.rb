# frozen_string_literal: true

FactoryBot.define do
  factory :couchdb_topic, :class => CouchDB::Topic do
    title { Faker::Lorem.words(6).join(' ').capitalize }
  end
end