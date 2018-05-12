# frozen_string_literal: true

module MongoDB
  class Topic
    include Mongoid::Document

    ##
    # Properties
    #
    field :title

    ##
    # Relationships
    #
    embedded_in :event,
                :polymorphic => true

    has_many :events,
             :class_name => 'MongoDB::Event'
    ##
    # Validations
    #
  end
end
