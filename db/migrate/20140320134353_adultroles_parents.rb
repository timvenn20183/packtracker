class AdultrolesParents < ActiveRecord::Migration
  def change
        create_table :adultroles_parents, id: false do |t|
            t.integer :parent_id
            t.integer :adultrole_id
        end
        add_index :adultroles_parents, :parent_id
        add_index :adultroles_parents, :adultrole_id
  end
end
