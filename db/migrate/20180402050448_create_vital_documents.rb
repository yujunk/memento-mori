class CreateVitalDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :vital_documents do |t|     
      t.string :identification_number
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :document_type, default: 0
      t.string :license_class
      t.date :issue_date
      t.date :expiration_date
      t.string :place_of_issue
      t.string :country_of_issue
      t.string :paperwork_location, null: false
      t.text :instructions
      t.string :doc_uploads, array:true, default: [] 
      t.timestamps
    end

    add_reference :vital_documents, :user, foreign_key: true
  end
end
