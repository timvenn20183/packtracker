class CreateScouters < ActiveRecord::Migration
  def change
    create_table :scouters do |t|
      t.string :name

      t.timestamps
    end
  end
end
