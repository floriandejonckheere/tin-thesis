# frozen_string_literal: true

module Neo4j
  class ApplicationRecord
    include Neo4j::ActiveNode
  end
end
