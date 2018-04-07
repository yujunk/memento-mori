class ChangeColumnOnVitalDocuments < ActiveRecord::Migration[5.1]
  def change
    rename_column :vital_documents, :document, :document_type
  end
end
