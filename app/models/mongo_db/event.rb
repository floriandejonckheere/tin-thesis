# frozen_string_literal: true

module MongoDB
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps::Created

    ##
    # Properties
    #
    field :predicate,
          :type => Symbol

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
