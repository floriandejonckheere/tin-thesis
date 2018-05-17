# frozen_string_literal: true

module Neo4j
  class Subject
    include Neo4j::ActiveNode

    ##
    # Properties
    #
    property :first_name,
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
      first_name
    end
  end
end