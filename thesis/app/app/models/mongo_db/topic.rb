# frozen_string_literal: true

module MongoDB
  class Topic < MongoDB::Object
    ##
    # Properties
    #
    field :title

    ##
    # Relationships
    #
    has_many :events,
             :class_name => 'MongoDB::Event'

    ##
    # Validations
    #
    ##
    # Methods
    #
    def to_s
      title
    end
  end
end
