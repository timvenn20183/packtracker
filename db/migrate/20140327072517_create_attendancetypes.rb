class CreateAttendancetypes < ActiveRecord::Migration
  def change
    create_table :attendancetypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
