# frozen_string_literal: true

module MongoDB
  class Subject
    include Mongoid::Document

    ##
    # Properties
    #
    field :first_name,
          :type => String

    ##
    # Relationships
    #
    embedded_in :event,
                :class_name => 'MongoDB::Event'

    ##
    # Validations
    #
    validates :first_name,
              :presence => true

    ##
    # Methods
    #
    def to_s
      first_name
    end
  end
end
