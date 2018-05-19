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
    validates :first_name,
              :presence => true

    ##
    # Methods
    #
    def to_s
      first_name
    end
  end
end
