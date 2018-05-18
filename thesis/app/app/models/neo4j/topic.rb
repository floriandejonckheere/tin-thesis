# frozen_string_literal: true

module Neo4j
  class Topic < Item
    ##
    # Properties
    #
    property :title,
             :type => String

    ##
    # Relations
    #
    ##
    # Validations
    #
    validates :title,
              :presence => true

    ##
    # Methods
    #
    def to_s
      "'#{title}'"
    end
  end
end
