# frozen_string_literal: true

require 'benchmark'

require 'rails_helper'

RSpec.describe 'Neo4j' do
  context 'querying' do
    describe 'Select N most recent events, where the event is related to a given user, ordered reverse chronologically' do
      # Select random user
      id = Neo4j::Subject
           .skip(rand Neo4j::Subject.count)
           .first
           .id

      benchmark do |count|
        Neo4j::Subject
          .find(id)
          .events
          .order(:created_at => :desc)
          .limit(count)
          .each(&:to_s)
      end
    end
  end
end
