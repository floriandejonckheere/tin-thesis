# frozen_string_literal: true

module MongoDB
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps::Created
    extend Enumerize

    ##
    # Properties
    #
    field :predicate,
          :type => String

    enumerize :predicate,
              :in => %i[created updated renamed commented_on annotated reacted_to],
              :predicates => true

    field :text,
          :type => String

    ##
    # Relationships
    #
    embeds_one :subject,
               :class_name => 'MongoDB::Subject'

    embeds_one :item,
               :class_name => 'MongoDB::Item',
               :as => :event

    ##
    # Validations
    #
    validates :text,
              :presence => true,
              :if => :commented_on?

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
  end
end
