# frozen_string_literal: true

module MongoDB
  class Annotation < MongoDB::Object
    ##
    # Properties
    #
    field :text

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
      'annotation'
    end
  end
end
