# frozen_string_literal: true

require 'benchmark'

require 'rails_helper'

RSpec.describe 'MongoDB' do
  context 'querying' do
    describe 'Select N most recent events, where the event is related to a given topic, ordered reverse chronologically' do
      # Select random topic
      id = MongoDB::Event
           .where('item._type' => 'MongoDB::Topic')
           .skip(rand MongoDB::Event.where('item._type' => 'MongoDB::Topic').count)
           .first
           .item
           .id

      benchmark do |count|
        MongoDB::Event
          .where('item._id' => id)
          .order_by(:created_at => :desc)
          .limit(count)
          .each(&:to_s)
      end
    end
  end
end
