# frozen_string_literal: true

module Neo4j
  class Subject < ApplicationRecord
    ##
    # Properties
    #

    ##
    # Relations
    #
    has_many :out,
             :objects,
             :rel_class => 'Neo4j::Event'

    ##
    # Validations
    #
  end
end
