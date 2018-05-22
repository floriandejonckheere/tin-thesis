# frozen_string_literal: true

require 'benchmark'

require 'rails_helper'

RSpec.describe 'CouchDB' do
  context 'querying' do
    describe 'Select N most recent events, ordered reverse chronologically' do
      benchmark do |count|
        CouchDB::Event
          .by_created_at
          .descending
          .limit(count)
          .each(&:to_s)
      end
    end
  end
end
