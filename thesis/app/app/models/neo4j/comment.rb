# frozen_string_literal: true

module Neo4j
  class Comment < Neo4j::Item
    ##
    # Properties
    #
    property :text,
             :type => String

    ##
    # Relations
    #
    has_one :out,
            :subject,
            :type => :by,
            :model_class => 'Neo4j::Subject'

    ##
    # Validations
    #
    ##
    # Methods
    #
    def to_s
      'comment'
    end
  end
end
