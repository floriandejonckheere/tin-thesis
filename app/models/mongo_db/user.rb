# frozen_string_literal: true

module MongoDB
  class User < ApplicationRecord

    ##
    # Properties
    #
    field :email,
          :type => String

    field :first_name,
          :type => String

    field :last_name,
          :type => String

    ##
    # Relations
    #
    has_many :topics,
             :class_name => 'MongoDB::Topic'

    has_many :comments,
             :class_name => 'MongoDB::Comment'

    has_many :annotations,
             :class_name => 'MongoDB::Annotation'

    ##
    # Validations
    #
    validates :email,
              :presence => true
  end
end
