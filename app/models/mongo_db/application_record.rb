# frozen_string_literal: true

module MongoDB
  class ApplicationRecord
    include Mongoid::Document
    include Mongoid::Timestamps
  end
end
