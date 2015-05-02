class MigrationName < ActiveRecord::Migration
   def change
    add_column :models,:name,:string
  end
end
