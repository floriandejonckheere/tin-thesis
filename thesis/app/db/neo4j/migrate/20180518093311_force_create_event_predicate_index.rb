# frozen_string_literal: true

class ForceCreateEventPredicateIndex < Neo4j::Migrations::Base
  def up
    add_index :Event, :predicate, :force => true
  end

  def down
    drop_index :Event, :predicate
  end
end
