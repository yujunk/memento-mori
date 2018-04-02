class CreateVitalDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :vital_documents do |t|     
      t.string :identification, null: false
      t.date :expiration_date, null: false
      t.string :country_of_issue
      t.string :paperwork_location, null: false
      t.string :instructions
      t.string :doc_upload #as string or json? blog vs healfly
      t.timestamps
    end

    add_reference :vital_documents, :user, foreign_key: true
  end
end
