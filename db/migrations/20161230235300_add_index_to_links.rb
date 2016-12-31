# frozen_string_literal: true
Hanami::Model.migration do
  change do
    add_index :links, :url, unique: true
  end
end
