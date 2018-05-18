# frozen_string_literal: true

require 'benchmark'

require 'rails_helper'

RSpec.describe 'MongoDB' do
  context 'querying' do
    describe 'Select N most recent events, where the event is related to a given user, ordered reverse chronologically' do
      # Select random user
      id = MongoDB::Event
           .skip(rand MongoDB::Event.count)
           .first
           .subject
           .id

      benchmark do |count|
        MongoDB::Event
          .where('subject._id' => id)
          .order_by(:created_at => :desc)
          .limit(count)
          .each(&:to_s)
      end
    end
  end
end
