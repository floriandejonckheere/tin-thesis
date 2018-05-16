# frozen_string_literal: true

module Neo4j
  class User < Subject
    ##
    # Properties
    #
    property :email,
             :type => String

    property :first_name,
             :type => String

    property :last_name,
             :type => String

    ##
    # Relations
    #

    ##
    # Validations
    #
    validates :email,
              :presence => true
  end
end
