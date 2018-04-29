# frozen_string_literal: true

module Neo4j
  class Item < ApplicationRecord
    ##
    # Properties
    #

    ##
    # Relations
    #
    has_many :in,
             :subjects,
             :rel_class => 'Neo4j::Event'

    ##
    # Validations
    #
  end
end
