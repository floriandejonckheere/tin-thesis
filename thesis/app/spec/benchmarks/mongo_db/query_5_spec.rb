# frozen_string_literal: true

require 'benchmark'

require 'rails_helper'

RSpec.describe 'MongoDB' do
  context 'insertion' do
    describe 'Insert N given events' do
      # Select random user
      subject_id = MongoDB::Event
                   .skip(rand MongoDB::Event.count)
                   .first
                   .subject
                   .id

      # Select random topic
      item_id = MongoDB::Event
                .where('item._type' => 'MongoDB::Topic')
                .skip(rand MongoDB::Event.where('item._type' => 'MongoDB::Topic').count)
                .first
                .item
                .id

      benchmark do |count|
        MongoDB::Event.create! :subject => subject_id,
                               :item => item_id,
                               :predicate => :updated
      end
    end
  end
end
