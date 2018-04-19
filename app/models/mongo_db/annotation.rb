# frozen_string_literal: true

module MongoDB
  class Annotation < ApplicationRecord

    ##
    # Properties
    #
    field :text,
          :type => String

    ##
    # Relations
    #
    belongs_to :user,
               :class_name => 'MongoDB::User'

    belongs_to :topic,
               :class_name => 'MongoDB::Topic'

    ##
    # Validations
    #
    validates :user,
              :presence => true

    validates :topic,
              :presence => true
  end
end
