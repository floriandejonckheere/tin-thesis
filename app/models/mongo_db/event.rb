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
    has_one :subject,
            :class_name => 'User'

    has_one :object,
            :as => :object

    ##
    # Validations
    #
  end
end
