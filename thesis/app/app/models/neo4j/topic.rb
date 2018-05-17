# frozen_string_literal: true

module Neo4j
  class Topic
    include Neo4j::ActiveNode

    ##
    # Properties
    #
    property :title,
             :type => String

    ##
    # Relations
    #
    has_many :out,
             :events,
             :type => :about,
             :model_class => 'Neo4j::Item'

    ##
    # Validations
    #
    ##
    # Methods
    #
    def to_s
      title
    end
  end
end
