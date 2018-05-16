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
            :item,
            :type => :on,
            :model_class => %i[Neo4j::Topic Neo4j::Comment]

    ##
    # Validations
    #
    validates :text,
              :presence => true

    validates :user,
              :presence => true

    validates :item,
              :presence => true
  end
end
