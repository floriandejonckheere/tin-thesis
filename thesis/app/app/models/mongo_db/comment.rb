# frozen_string_literal: true

module MongoDB
  class Comment < MongoDB::Item
    ##
    # Properties
    #
    field :text

    ##
    # Relationships
    #
    embeds_one :subject,
               :class_name => 'MongoDB::Subject'

    ##
    # Validations
    #
    validates :subject,
              :presence => true

    ##
    # Methods
    #
    def to_s
      'comment'
    end
  end
end
