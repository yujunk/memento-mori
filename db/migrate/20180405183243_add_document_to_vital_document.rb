class AddDocumentToVitalDocument < ActiveRecord::Migration[5.1]
  def change
    add_column :vital_documents, :document, :string
  end
end
