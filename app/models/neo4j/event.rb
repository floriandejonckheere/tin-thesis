# frozen_string_literal: true

module Neo4j
  class Event
    include Neo4j::ActiveRel

    from_class 'Subject'
    to_class 'Object'

    ##
    # Properties
    #
    enum :predicate => %i[created updated renamed]

    property :timestamp,
             :type => Date

    ##
    # Validations
    #
    validates_presence_of :timestamp
  end
end
