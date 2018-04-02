class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|     
      t.string :username, :string, null: false
      t.string :email, :string, null: false
      t.string :first_name, :string, null: false
      t.string :last_name, :string, null: false
      t.string :password, :string, null: false
      # t.string :encrypted_password, limit: 128
      # t.string :confirmation_token, limit: 128
      # t.string :remember_token, limit: 128, null: false
      t.integer :type, default: 0 
      #STI & Enum - should use "role" instead of "type"? - blog vs healfly
      t.timestamps
    end
    
    add_index :users, :email
    add_index :users, :username
    # add_index :users, :remember_token
  end
end
