class CreateRecruits < ActiveRecord::Migration
  def change
    create_table :recruits do |t|
      t.string :region
      t.string :district
      t.string :group
      t.boolean :cub
      t.boolean :scout
      t.boolean :meerkat
      t.datetime :form_date
      t.string :recruit_surname
      t.string :recruit_initials
      t.string :recruit_firstnames
      t.string :recruit_idnumber
      t.datetime :recruit_dob
      t.text :recruit_address
      t.string :recruit_tel_home
      t.string :recruit_tel_cell
      t.string :recruit_email
      t.integer :recruit_gender
      t.string :recruit_religion
      t.text :recruit_special_conditions
      t.string :doctor_name
      t.string :doctor_tel
      t.string :medical_scheme
      t.string :medical_number
      t.string :medical_principle
      t.string :school
      t.string :searchstring
      t.integer :sixer_id
      t.integer :patrol_id
      t.integer :burrow_id
      t.text :hobby
      t.boolean :is_sixer
      t.boolean :is_second
      t.boolean :is_patrol_leader
      t.boolean :is_assistant_patrol_leader
      t.timestamps
    end
    add_index :recruits, :sixer_id
    add_index :recruits, :patrol_id
    add_index :recruits, :burrow_id
  end
end
