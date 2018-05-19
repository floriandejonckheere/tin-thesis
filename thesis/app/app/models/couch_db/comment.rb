# frozen_string_literal: true

module CouchDB
  class Comment < Item
    ##
    # Properties
    #
    ##
    # Relationships
    #
    property :subject,
             CouchDB::Subject

    property :topic,
             CouchDB::Topic

    ##
    # Validations
    #
    ##
    # Methods
    #
    def to_s
      "#{subject}'s comment on #{topic}"
    end
  end
end
