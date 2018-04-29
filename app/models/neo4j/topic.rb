# frozen_string_literal: true

module Neo4j
  class Topic < Object
    ##
    # Properties
    #
    property :title,
             :type => String

    property :description,
             :type => String

    ##
    # Relations
    #

    ##
    # Validations
    #
    validates :title,
              :presence => true
  end
end
