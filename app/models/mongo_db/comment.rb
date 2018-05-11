# frozen_string_literal: true

module MongoDB
  class Comment
    include Mongoid::Document

    ##
    # Properties
    #
    field :title,
          :type => Symbol

    ##
    # Relationships
    #
    has_one :topic
    embeds_one :subject

    ##
    # Validations
    #
  end
end
