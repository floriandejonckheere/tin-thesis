# frozen_string_literal: true

require 'benchmark'

require 'rails_helper'

RSpec.describe 'Neo4j' do
  context 'querying' do
    describe 'Select N most recent events, where the event is related to a given topic, ordered reverse chronologically' do
      # Select random topic
      id = Neo4j::Topic
           .skip(rand Neo4j::Topic.count)
           .first
           .id

      benchmark do |count|
        Neo4j::Topic
          .find(id)
          .events
          .order(:created_at => :desc)
          .limit(count)
          .each(&:to_s)
      end
    end
  end
end
