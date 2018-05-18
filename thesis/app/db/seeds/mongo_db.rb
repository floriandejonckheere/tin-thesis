# frozen_string_literal: true

##
# Clear database
#
[
  MongoDB::Subject,
  MongoDB::Comment,
  MongoDB::Annotation,
  MongoDB::Topic,
  MongoDB::Event
].each(&:delete_all)

##
# Seed database
#
## Embedded documents
subjects = (FACTOR / 5).times.map { FactoryBot.build(:mongodb_subject) }
topics = FACTOR.times.map { FactoryBot.build(:mongodb_topic) }
annotations = (FACTOR * 5).times.map { FactoryBot.build(:mongodb_annotation) }
comments = (FACTOR * 5).times.map do
  c = FactoryBot.build :mongodb_comment,
                       subjects.sample
end

## Topics
puts "Creating #{FACTOR} :created events"
FACTOR.times do
  topic = topics.sample
  topic.save!

  MongoDB::Event.create! :predicate => :created,
                         :subject => subjects.sample,
                         :object => topic,
                         :topic => topic
end

## Updates on topics
puts "Creating #{FACTOR * 3} :updated and :renamed events"
(FACTOR * 3).times do
  topic = topics.sample
  topic.save!

  MongoDB::Event.create! :predicate => weighted_rand(:updated => 0.9, :renamed => 0.1),
                         :subject => subjects.sample,
                         :object => topic,
                         :topic => topic
end

## Annotations
puts "Creating #{FACTOR * 5} :annotated events"
(FACTOR * 5).times do
  topic = topics.sample
  topic.save!

  annotation = annotations.sample
  annotation.save!

  MongoDB::Event.create! :predicate => :annotated,
                         :subject => subjects.sample,
                         :object => annotation,
                         :topic => topic
end

## Comments
puts "Creating #{FACTOR * 4} :commented_on events"
(FACTOR * 4).times do
  topic = topics.sample
  topic.save!

  comment = comments.sample
  comment.save!

  MongoDB::Event.create! :predicate => :commented_on,
                         :subject => subjects.sample,
                         :object => comment,
                         :topic => topic
end

## Reactions
puts "Creating #{FACTOR} :reacted_to events"
(FACTOR / 5).times do
  topic = topics.sample
  topic.save!

  comment = comments.sample
  comment.save!

  MongoDB::Event.create! :predicate => :reacted_to,
                         :subject => subjects.sample,
                         :object => comment,
                         :topic => topic
end
