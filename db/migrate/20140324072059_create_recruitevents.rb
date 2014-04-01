class CreateRecruitevents < ActiveRecord::Migration
  def change
    create_table :recruitevents do |t|
      t.date :related_date
      t.integer :recruit_id
      t.integer :attendancetype_id
      t.timestamps
    end
    add_index :recruitevents, :recruit_id
    add_index :recruitevents, :attendancetype_id
 end
end
