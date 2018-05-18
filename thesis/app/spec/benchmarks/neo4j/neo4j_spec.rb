# frozen_string_literal: true

require 'rails_helper'

describe 'Neo4j' do
  describe 'sanity checks' do
    it 'has connection' do
      expect(-> { Neo4j::ActiveBase.establish_session }).not_to raise_error
    end
  end
end
