# frozen_string_literal: true

require 'benchmark'

require 'rails_helper'

RSpec.describe 'Neo4j' do
  context 'querying' do
    describe 'Select N most recent events, where the event is related to a topic in a list of given topics, ordered reverse chronologically' do
      # Select 50 random topics
      ids = Neo4j::Topic.skip(rand Neo4j::Topic.count).limit(50).map &:id

      benchmark do |count|
        Neo4j::Topic
          .where(:id => ids)
          .events
          .order_by(:created_at => :desc)
          .limit(count)
          .each(&:to_s)
      end
    end
  end
end
