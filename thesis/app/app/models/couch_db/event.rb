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

    property :created_at,
             Time

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

    validates :created_at,
              :presence => true

    validates :subject,
              :presence => true

    validates :item,
              :presence => true

    ##
    # Methods
    #
    def to_s
      if predicate == :commented_on
        "#{subject} #{predicate.to_s.humanize.downcase} #{item}: #{text}"
      else
        "#{subject} #{predicate.to_s.humanize.downcase} #{item}"
      end
    end

    ##
    # Views
    #
    design do
      view :all
    end
  end
end
