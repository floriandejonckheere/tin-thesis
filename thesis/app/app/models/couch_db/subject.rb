# frozen_string_literal: true

module CouchDB
  class Subject < CouchRest::Model::Base
    include CouchRest::Model::Embeddable

    ##
    # Properties
    #
    property :first_name,
             String

    ##
    # Relationships
    #
    ##
    # Validations
    #
  end
end
