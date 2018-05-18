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
    has_many :in,
             :events,
             :type => :by,
             :model_class => 'Neo4j::Event'

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
