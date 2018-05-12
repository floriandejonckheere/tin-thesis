# frozen_string_literal: true

module MongoDB
  class Comment
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

    embeds_one :subject,
               :class_name => 'MongoDB::Subject'

    ##
    # Validations
    #
  end
end
