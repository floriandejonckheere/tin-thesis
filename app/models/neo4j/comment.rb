# frozen_string_literal: true

module Neo4j
  class Comment < Item
    ##
    # Properties
    #
    property :text,
             :type => String

    ##
    # Relations
    #
    has_one :out,
            :user,
            :type => :by,
            :model_class => 'Neo4j::User'

    has_one :out,
            :topic,
            :type => :on,
            :model_class => 'Neo4j::Topic'

    ##
    # Validations
    #
    validates :text,
              :presence => true

    validates :user,
              :presence => true

    validates :topic,
              :presence => true
  end
end
