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
    embeds_one :subject,
               :class_name => 'MongoDB::Subject'

    embeds_one :object,
               :as => :event

    belongs_to :topic,
               :class_name => 'MongoDB::Topic'

    ##
    # Validations
    #
  end
end
