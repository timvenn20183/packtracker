class CreateAdultroles < ActiveRecord::Migration
  def change
    create_table :adultroles do |t|
      t.string :name
      t.text :options

      t.timestamps
    end
  end
end
