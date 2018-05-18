# frozen_string_literal: true

module MongoDB
  class Topic < MongoDB::Item
    ##
    # Properties
    #
    field :title,
          :type => String

    ##
    # Relationships
    #
    ##
    # Validations
    #
    ##
    # Methods
    #
    def to_s
      "'#{title}'"
    end
  end
end
