# frozen_string_literal: true

module MongoDB
  class Comment < ApplicationRecord

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

    belongs_to :comment,
               :class_name => 'MongoDB::Comment'

    has_many :comments,
             :as => :children,
             :class_name => 'MongoDB::Comment'

    ##
    # Validations
    #
    validates :user,
              :presence => true

    validates :topic,
              :presence => true
  end
end
