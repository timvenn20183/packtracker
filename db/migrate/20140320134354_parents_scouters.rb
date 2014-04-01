class ParentsScouters < ActiveRecord::Migration
  def change
        create_table :parents_scouters, id: false do |t|
            t.integer :parent_id
            t.integer :scouter_id
        end
        add_index :parents_scouters, :parent_id
        add_index :parents_scouters, :scouter_id
  end
end
