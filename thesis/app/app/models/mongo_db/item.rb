# frozen_string_literal: true

module MongoDB
  class Item
    include Mongoid::Document

    ##
    # Properties
    #
    field :_type

    ##
    # Relationships
    #
    embedded_in :event,
                :polymorphic => true,
                :class_name => 'MongoDB::Event'

    ##
    # Validations
    #
    ##
    # Methods
    #
  end
end
