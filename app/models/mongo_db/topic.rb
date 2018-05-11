# frozen_string_literal: true

module MongoDB
  class Topic
    include Mongoid::Document

    ##
    # Properties
    #
    field :title,
          :type => Symbol

    ##
    # Relationships
    #
    ##
    # Validations
    #
  end
end
