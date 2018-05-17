# frozen_string_literal: true

class ForceCreateItemUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Item, :uuid, :force => true
  end

  def down
    drop_constraint :Item, :uuid
  end
end
