# frozen_string_literal: true

require 'benchmark'

require 'rails_helper'

RSpec.describe 'MongoDB' do
  context 'querying' do
    describe 'Select N most recent events, where the event is related to a topic in a list of given topics, ordered reverse chronologically' do
      # Select 50 random topics
      ids = MongoDB::Event
            .where('item._type' => 'MongoDB::Topic')
            .skip(rand MongoDB::Event.where('item._type' => 'MongoDB::Topic').count)
            .limit(50)
            .map { |e| e.item.id }

      benchmark do |count|
        MongoDB::Event
          .in('item._id' => ids)
          .order_by(:created_at => :desc)
          .limit(count)
          .each(&:to_s)
      end
    end
  end
end
