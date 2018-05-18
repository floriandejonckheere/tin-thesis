# frozen_string_literals: true

##
# Neo4j utility functions
#

puts 'Seeding Neo4j database'

tx = Neo4j::ActiveBase.current_session.transaction

##
# Clear database
#
[
  Neo4j::Comment,
  Neo4j::Item,
  Neo4j::Subject,
  Neo4j::Topic,
].each(&:delete_all)

##
# Seed database
#

## Subjects
puts 'Creating subjects'
(FACTOR / 5).times { FactoryBot.create :neo4j_subject }
subjects = Neo4j::Subject.all.to_a

## Topics
puts 'Creating topics'
FACTOR.times { FactoryBot.create :neo4j_topic }
topics = Neo4j::Topic.all.to_a

## Events
puts 'Creating events'
Neo4j::Topic.all.each do |topic|
  subject = subjects.sample

  Neo4j::Event.create! :subject => subject,
                       :item => topic,
                       :predicate => :created

  3.times do
    Neo4j::Event.create! :subject => subject,
                         :item => topic,
                         :predicate => weighted_rand(:updated => 0.9, :renamed => 0.1)
  end
end

(FACTOR * 5).times do
  Neo4j::Event.create! :subject => subjects.sample,
                       :item => topics.sample,
                       :predicate => :annotated
end

## Comments
puts 'Creating comments'
(FACTOR * 3).times.map do
  FactoryBot.create :neo4j_comment,
                    :subject => subjects.sample,
                    :topic => topics.sample
end
comments = Neo4j::Comment.all.to_a

items = (topics + comments)
(FACTOR * 5).times do
  Neo4j::Event.create! :subject => subjects.sample,
                       :item => items.sample,
                       :predicate => :commented_on,
                       :text => Faker::Lorem.words(20).join(' ').capitalize
end

(FACTOR / 2).times do
  Neo4j::Event.create! :subject => subjects.sample,
                       :item => items.sample,
                       :predicate => :reacted_to
end

tx.commit
