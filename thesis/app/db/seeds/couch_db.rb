# frozen_string_literal: true

puts 'Seeding CouchDB database'

##
# Clear database
#
CouchDB::Event.all.each &:delete

##
# Seed database
#

## Subjects (embedded)
puts 'Creating subjects'
subjects = (FACTOR / 5).times.map { FactoryBot.build :couchdb_subject }

## Topics (embedded)
puts 'Creating topics'
topics = FACTOR.times.map { FactoryBot.build :couchdb_topic }

## Events
puts 'Creating events'
topics.each do |topic|
  subject = subjects.sample

  CouchDB::Event.create! :subject => subject,
                         :item => topic,
                         :predicate => :created,
                         :created_at => Faker::Time.backward(365)

  3.times do
    CouchDB::Event.create! :subject => subject,
                           :item => topic,
                           :predicate => weighted_rand(:updated => 0.9, :renamed => 0.1),
                           :created_at => Faker::Time.backward(365)
  end
end

(FACTOR * 5).times do
  CouchDB::Event.create! :subject => subjects.sample,
                         :item => topics.sample,
                         :predicate => :annotated,
                         :created_at => Faker::Time.backward(365)
end

## Comments
puts 'Creating comments'
comments = (FACTOR * 3).times.map do
  FactoryBot.build :couchdb_comment,
                   :subject => subjects.sample,
                   :topic => topics.sample
end

items = (topics + comments)
(FACTOR * 5).times do
  CouchDB::Event.create! :subject => subjects.sample,
                         :item => items.sample,
                         :predicate => :commented_on,
                         :text => Faker::Lorem.words(20).join(' ').capitalize,
                         :created_at => Faker::Time.backward(365)
end

(FACTOR / 2).times do
  CouchDB::Event.create! :subject => subjects.sample,
                         :item => items.sample,
                         :predicate => :reacted_to,
                         :created_at => Faker::Time.backward(365)
end
