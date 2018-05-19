# frozen_string_literal: true

FactoryBot.define do
  factory :couchdb_subject, :class => CouchDB::Subject do
    first_name { Faker::Name.first_name }
  end
end
