class CommitteesParents < ActiveRecord::Migration
  def change
        create_table :committees_parents, id: false do |t|
            t.integer :parent_id
            t.integer :committee_id
        end
        add_index :committees_parents, :parent_id
        add_index :committees_parents, :committee_id
  end
end
