# frozen_string_literal: true

require 'benchmark'

require 'rails_helper'

RSpec.describe 'Neo4j' do
  context 'insertion' do
    describe 'Insert N given events' do
      # Select random user
      subject_id = Neo4j::Subject
                   .skip(rand Neo4j::Subject.count)
                   .first
                   .id

      # Select random topic
      item_id = Neo4j::Item
                .skip(rand Neo4j::Item.count)
                .first
                .id

      benchmark do
        Neo4j::Event .create! :subject => subject_id,
                              :item => item_id,
                              :predicate => :updated
      end
    end
  end
end
