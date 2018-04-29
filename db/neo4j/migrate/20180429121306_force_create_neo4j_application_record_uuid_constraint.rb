# frozen_string_literal: true

class ForceCreateNeo4jApplicationRecordUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :'Neo4j::ApplicationRecord', :uuid, :force => true
  end

  def down
    drop_constraint :'Neo4j::ApplicationRecord', :uuid
  end
end
