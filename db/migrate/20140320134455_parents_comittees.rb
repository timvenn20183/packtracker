class ParentsComittees < ActiveRecord::Migration
  def change
        create_table :parents_committees, id: false do |t|
            t.integer :parent_id
            t.integer :committee_id
        end
        add_index :parents_committees, :parent_id
        add_index :parents_committees, :committee_id
  end
end
