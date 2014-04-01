class CreateBurrows < ActiveRecord::Migration
  def change
    create_table :burrows do |t|
      t.string :name

      t.timestamps
    end
  end
end
