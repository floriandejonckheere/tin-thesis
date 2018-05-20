# frozen_string_literal: true

module CouchDB
  class Event < CouchRest::Model::Base
    extend Enumerize

    ##
    # Properties
    #
    property :predicate,
             String

    enumerize :predicate,
              :in => %i[created updated renamed commented_on annotated reacted_to]

    property :text,
             String

    timestamps!

    ##
    # Relationships
    #
    property :subject,
             CouchDB::Subject

    property :item,
             CouchDB::Item

    ##
    # Validations
    #

    validates :predicate,
              :presence => true

    validates :text,
              :presence => true,
              :if => -> { predicate == :commented_on }

    validates :subject,
              :presence => true

    validates :item,
              :presence => true

    ##
    # Methods
    #
    def to_s
      if predicate == :commented_on
        "#{subject} #{predicate} #{item}: #{text}"
      else
        "#{subject} #{predicate} #{item}"
      end
    end

    ##
    # Views
    #
    design do
      view :all

      view :by_subject
      view :by_item
    end
  end
end
