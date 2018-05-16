# frozen_string_literal: true

module MongoDB
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps::Created
    extend Enumerize

    ##
    # Properties
    #
    field :predicate

    enumerize :predicate,
              :in => %i[created updated renamed commented annotated reacted]

    ##
    # Relationships
    #
    embeds_one :subject,
               :class_name => 'MongoDB::Subject'

    embeds_one :object,
               :class_name => 'MongoDB::Object',
               :as => :event

    belongs_to :topic,
               :class_name => 'MongoDB::Topic'

    ##
    # Validations
    #
    validates :subject,
              :presence => true

    validates :object,
              :presence => true

    ##
    # Methods
    #
    def to_s
      case predicate
      when 'created'
        "#{subject} created #{object}"
      when 'updated'
        "#{subject} updated #{object}"
      when 'renamed'
        "#{subject} renamed #{object}"
      when 'commented'
        "#{subject} commented on #{object}"
      when 'annotated'
        "#{subject} annotated #{object}"
      when 'reacted'
        "#{subject} reacted to #{object}"
      else
        "#{subject} #{predicate} #{object}"
      end
    end
  end
end
