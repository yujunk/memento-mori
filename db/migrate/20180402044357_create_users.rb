class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|     
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :password_digest
      t.string :password_confirmation
      t.string :session_token, limit: 128
      t.integer :role, default: 0 
      t.timestamps
    end
    
    add_index :users, :email
    add_index :users, :session_token
  end
end
