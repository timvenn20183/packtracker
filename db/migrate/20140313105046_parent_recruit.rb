class ParentRecruit < ActiveRecord::Migration
  def change
        create_table :parents_recruits, id: false do |t|
            t.integer :parent_id
            t.integer :recruit_id
        end
        add_index :parents_recruits, :parent_id
        add_index :parents_recruits, :recruit_id
  end
end
