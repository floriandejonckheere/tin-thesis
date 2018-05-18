# frozen_string_literal: true

module Neo4j
  class Event
    include Neo4j::ActiveNode
    include Neo4j::Timestamps::Created

    ##
    # Properties
    #
    enum :predicate => %i[created updated renamed commented_on annotated reacted_to]

    property :text,
             :type => String

    ##
    # Relations
    #
    has_one :out,
            :subject,
            :type => :by,
            :model_class => 'Neo4j::Subject'

    has_one :out,
            :item,
            :type => :on,
            :model_class => 'Neo4j::Item'

    ##
    # Validations
    #
    ##
    # Methods
    #
    def to_s
      if predicate == :commented_on
        return "#{subject} #{predicate.to_s.humanize.downcase} #{item}: #{text}"
      else
        return "#{subject} #{predicate.to_s.humanize.downcase} #{item}"
      end
    end
  end
end
