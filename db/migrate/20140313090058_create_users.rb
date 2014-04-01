class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :recruit_id
      t.integer :parent_id
      t.boolean :cub_access
      t.boolean :scout_access
      t.boolean :parent_access
      t.boolean :blog_access
      t.boolean :group_access
      t.text :options
      t.timestamps
    end
    add_index :users, :parent_id
    add_index :users, :recruit_id
  end
end
