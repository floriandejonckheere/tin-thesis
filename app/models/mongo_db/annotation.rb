# frozen_string_literal: true

module MongoDB
  class Annotation
    include Mongoid::Document

    ##
    # Properties
    #
    field :text

    ##
    # Relationships
    #
    embedded_in :event,
                :polymorphic => true

    ##
    # Validations
    #
    ##
    # Methods
    #
  end
end
