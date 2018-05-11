# frozen_string_literal: true

module MongoDB
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps::Created
    extend Enumerize

    ##
    # Properties
    #
    field :predicate

    enumerize :predicate,
              :in => %i[created updated renamed commented annotated reacted]

    ##
    # Relationships
    #
    embeds_one :subject

    has_one :object,
            :as => :object

    ##
    # Validations
    #
  end
end
