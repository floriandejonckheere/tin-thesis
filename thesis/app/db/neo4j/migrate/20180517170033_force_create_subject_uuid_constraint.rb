# frozen_string_literal: true

class ForceCreateSubjectUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Subject, :uuid, :force => true
  end

  def down
    drop_constraint :Subject, :uuid
  end
end
