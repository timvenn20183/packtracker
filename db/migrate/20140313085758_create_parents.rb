class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :surname
      t.string :firstnames
      t.string :idnumber
      t.text :address
      t.string :postal_code
      t.string :tel_work
      t.string :email
      t.string :cell
      t.string :tel_home
      t.boolean :gender
      t.string :marital_status
      t.string :occupation
      t.string :employer
      t.string :searchstring
      t.boolean :member_of_scouts_sa, :default => false
      t.text :hobby
      t.text :family_code
      t.timestamps
    end
  end
end
