# frozen_string_literal: true

module CouchDB
  class Event < CouchRest::Model::Base
    ##
    # Properties
    #
    property :predicate,
             Symbol

    timestamps!

    ##
    # Relationships
    #
    property :subject,
             Subject

    property :object

    ##
    # Validations
    #
    validates :predicate,
              :inclusion => {:in => %i[created updated renamed commented annotated reacted] }
  end
end
