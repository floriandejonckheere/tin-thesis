# frozen_string_literal: true

module CouchDB
  class Topic < Item
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
    validates :title,
              :presence => true

    ##
    # Methods
    #
    def to_s
      "'#{title}'"
    end
  end
end
