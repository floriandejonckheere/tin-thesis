# frozen_string_literal: true

## Variables
# Test data multiplication factor
FACTOR = 1000

## Utility functions
def mongodb_rand(model)
  model.skip(rand(model.count)).first
end

# https://gist.github.com/O-I/3e0654509dd8057b539a
def weighted_rand(freq)
  freq.max_by { |_, weight| rand**(1.0 / weight) }.first
end

##
# MongoDB
#

## Clear database
[
  MongoDB::Subject,
  MongoDB::Comment,
  MongoDB::Annotation,
  MongoDB::Topic,
  MongoDB::Event
].each(&:delete_all)

## Embedded documents
subjects = (FACTOR / 5).times.map { FactoryBot.build(:mongodb_subject) }
topics = FACTOR.times.map { FactoryBot.build(:mongodb_topic) }
annotations = (FACTOR * 5).times.map { FactoryBot.build(:mongodb_annotation) }
comments = (FACTOR * 5).times.map { FactoryBot.build(:mongodb_comment) }

## Topics
puts "Creating #{FACTOR} :created events"
FACTOR.times do
  topic = topics.sample

  FactoryBot.create :mongodb_event,
                    :predicate => :created,
                    :subject => subjects.sample,
                    :object => topic,
                    :topic => topic
end

## Updates on topics
puts "Creating #{FACTOR * 3} :updated and :renamed events"
(FACTOR * 3).times do
  topic = topics.sample

  FactoryBot.create :mongodb_event,
                    :predicate => weighted_rand(:updated => 0.9, :renamed => 0.1),
                    :subject => subjects.sample,
                    :object => topic,
                    :topic => topic
end

## Annotations
puts "Creating #{FACTOR * 5} :annotated events"
(FACTOR * 5).times do
  FactoryBot.create :mongodb_event,
                    :predicate => :annotated,
                    :subject => subjects.sample,
                    :object => annotations.sample,
                    :topic => topics.sample
end

## Comments
puts "Creating #{FACTOR * 4} :commented events"
(FACTOR * 4).times do
  FactoryBot.create :mongodb_event,
                    :predicate => :commented,
                    :subject => subjects.sample,
                    :object => comments.sample,
                    :topic => topics.sample
end

## Reactions
puts "Creating #{FACTOR} :reacted events"
(FACTOR / 5).times do
  topic = topics.sample

  FactoryBot.create :mongodb_event,
                    :predicate => :reacted,
                    :subject => subjects.sample,
                    :object => topic,
                    :topic => topic
end
