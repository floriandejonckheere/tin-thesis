# frozen_string_literal: true

require 'rails_helper'

describe 'MongoDB' do
  describe 'sanity checks' do
    it 'has connection' do
      expect(-> { Mongoid.default_client.database_names.present? }).not_to raise_error
    end

    it 'has caching disabled' do
      expect(Mongoid::QueryCache.enabled?).to be false
    end
  end
end
