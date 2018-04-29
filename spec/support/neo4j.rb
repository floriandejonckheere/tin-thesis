# frozen_string_literal: true

RSpec.configure do |config|
  config.around do |example|
    Neo4j::ActiveBase.run_transaction do |tx|
      example.run
      tx.mark_failed
    end
  end
end
