# frozen_string_literal: true

module Neo4j
  class Event
    include Neo4j::ActiveRel
    include Neo4j::Timestamps::Created

    from_class 'Neo4j::Subject'
    to_class 'Neo4j::Item'

    ##
    # Properties
    #
    enum :predicate => %i[created updated renamed commented_on annotated reacted_to]

    property :timestamp,
             :type => Date

    ##
    # Validations
    #
  end
end
