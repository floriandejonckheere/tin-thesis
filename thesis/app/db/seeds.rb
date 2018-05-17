# frozen_string_literal: true

## Variables
# Test data multiplication factor
FACTOR = 100

##
# Global utility functions
#
# https://gist.github.com/O-I/3e0654509dd8057b539a
def weighted_rand(freq)
  freq.max_by { |_, weight| rand**(1.0 / weight) }.first
end

##
# Seeding
#

require_relative 'seeds/neo4j'