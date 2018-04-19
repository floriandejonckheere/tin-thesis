# frozen_string_literal: true

module MongoDB
  class Topic < ApplicationRecord

    ##
    # Properties
    #
    field :title,
          :type => String

    field :description,
          :type => String

    ##
    # Relations
    #
    belongs_to :user,
               :class_name => 'MongoDB::User'

    has_many :comments,
             :class_name => 'MongoDB::Comment'

    has_many :annotations,
             :class_name => 'MongoDB::Annotation'

    ##
    # Validations
    #
    validates :user,
              :presence => true
  end
end
