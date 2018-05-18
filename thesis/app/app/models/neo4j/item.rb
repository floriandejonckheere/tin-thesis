# frozen_string_literal: true

module Neo4j
  class Item
    include Neo4j::ActiveNode

    ##
    # Properties
    #
    ##
    # Relationships
    #
    has_many :in,
             :events,
             :type => :on,
             :model_class => 'Neo4j::Event'

    ##
    # Validations
    #
    ##
    # Methods
    #
  end
end
