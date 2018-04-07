class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|     
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :birthdate
      t.integer :phone_number, null: false, limit: 6
      t.string :email, null: false
      t.string :address
      t.string :city
      t.string :postcode
      t.string :relationship
      t.string :notes
      t.timestamps
    end

    add_reference :contacts, :user, foreign_key: true
  end
end
