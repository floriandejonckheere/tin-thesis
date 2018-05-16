# frozen_string_literal: true

module CouchDB
  class Topic < CouchRest::Model::Base
    ##
    # Properties
    #
    property :title,
             Symbol

    ##
    # Relationships
    #
    ##
    # Validations
    #
  end
end
