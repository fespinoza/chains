# frozen_string_literal: true

Hanami::Model.migration do
  up do
    execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'

    create_table :links do
      column :id, 'uuid',
             null: false,
             default: Hanami::Model::Sql.function(:uuid_generate_v4)
      column :url,        String, null: false
      column :tags,       'text[]'
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :links
    execute 'DROP EXTENSION IF EXISTS "uuid-ossp"'
  end
end
