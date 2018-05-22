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
      ## Return events ordered by created_at
      view :by_created_at,
           :map => "function(doc) {
             if (doc['#{model_type_key}'] == 'CouchDB::Event') {
               emit(doc.created_at, doc);
             }
           }"

      ## Return events with topic item, ordered randomly
      view :random_with_topic,
           :map => "function(doc) {
             if (doc['#{model_type_key}'] == 'CouchDB::Event' && doc.item.item_type == 'topic') {
               emit(Math.random(), doc);
             }
           }"

      # Return events with topic item
      view :with_topic,
           :map => "function(doc) {
             if (doc['#{model_type_key}'] == 'CouchDB::Event' && doc.item.item_type == 'topic') {
               emit(doc.created_at, doc);
             }
           }"
    end
  end
end
