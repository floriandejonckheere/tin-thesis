# frozen_string_literal: true

module Neo4j
  class Annotation < Neo4j::Object
    ##
    # Properties
    #
    property :text,
             :type => String

    ##
    # Relations
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
