# frozen_string_literal: true

require 'benchmark'

require 'rails_helper'

RSpec.describe 'Neo4j' do
  context 'querying' do
    describe 'Select N most recent events, ordered reverse chronologically' do
      benchmark do |count|
        Neo4j::Event
          .all
          .order(:created_at => :desc)
          .limit(count)
          .each(&:to_s)
      end
    end
  end
end
