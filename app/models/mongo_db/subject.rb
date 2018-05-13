# frozen_string_literal: true

module MongoDB
  class Subject
    include Mongoid::Document

    ##
    # Properties
    #
    field :first_name

    ##
    # Relationships
    #
    embedded_in :event,
                :class_name => 'MongoDB::Event'

    ##
    # Validations
    #
    ##
    # Methods
    #
  end
end
