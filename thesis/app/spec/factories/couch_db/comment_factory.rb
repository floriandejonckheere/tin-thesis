# frozen_string_literal: true

FactoryBot.define do
  factory :couchdb_comment, :class => CouchDB::Item do
    item_type :comment
  end
end
