# frozen_string_literal: true

module MongoDB
  class Comment < MongoDB::Item
    ##
    # Properties
    #
    ##
    # Relationships
    #
    embeds_one :subject,
               :class_name => 'MongoDB::Subject'

    embeds_one :topic,
               :class_name => 'MongoDB::Topic'

    ##
    # Validations
    #
    validates :subject,
              :presence => true

    validates :topic,
              :presence => true

    ##
    # Methods
    #
    def to_s
      "#{subject}'s comment on #{topic}"
    end
  end
end
