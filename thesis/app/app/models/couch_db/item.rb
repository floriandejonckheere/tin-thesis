# frozen_string_literal: true

module CouchDB
  class Item < CouchRest::Model::Base
    include CouchRest::Model::Embeddable
    extend Enumerize

    ##
    # Properties
    #
    property :item_type,
             String

    enumerize :item_type,
              :in => %i[topic comment]

    ## Subject properties
    property :title,
             Symbol

    ## Comment properties
    property :subject,
             CouchDB::Subject

    property :topic,
             CouchDB::Item

    ##
    # Relationships
    #
    ##
    # Validations
    #
    validates :item_type,
              :presence => true

    ## Subject properties
    validates :title,
              :presence => true,
              :if => -> { item_type == :topic }

    ## Comment properties
    validates :subject,
              :presence => true,
              :if => -> { item_type == :comment }

    validates :topic,
              :presence => true,
              :if => -> { item_type == :comment }

    ##
    # Methods
    #
    def to_s
      case item_type
      when :topic
        "'#{title}'"
      when :comment
        "#{subject}'s comment on #{topic}"
      else
        'item'
      end
    end
  end
end
