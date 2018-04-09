class ChangeColumnsInVitalDocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :vital_documents, :place_of_issue, :string 
    add_column :vital_documents, :issue_date, :date
    add_column :vital_documents, :license_class, :string
    remove_column :vital_documents, :identification, :string
  end
end
