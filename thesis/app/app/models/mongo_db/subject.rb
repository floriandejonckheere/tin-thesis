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
    ##
    # Validations
    #
    ##
    # Methods
    #
    def to_s
      first_name
    end
  end
end
