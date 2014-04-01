class CreateSixers < ActiveRecord::Migration
  def change
    create_table :sixers do |t|
      t.string :name

      t.timestamps
    end
  end
end
