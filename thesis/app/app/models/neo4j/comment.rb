# frozen_string_literal: true

module Neo4j
  class Comment < Item
    ##
    # Properties
    #
    ##
    # Relations
    #
    has_one :out,
            :subject,
            :type => :by,
            :model_class => 'Neo4j::Subject'

    has_one :out,
            :topic,
            :type => :on,
            :model_class => 'Neo4j::Topic'

    ##
    # Validations
    #
    validates :subject,
              :presence => true

    validates :topic,
              :presence => true

    ##
    # Methods
    #
    def to_s
      "#{subject}'s comment on #{topic}"
    end
  end
end
