# frozen_string_literal: true

module CouchDB
  class Comment < CouchRest::Model::Base
    ##
    # Properties
    #
    property :title,
             Symbol

    ##
    # Relationships
    #
    belongs_to :topic

    property :subject,
             Subject

    ##
    # Validations
    #
  end
end
