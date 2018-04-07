class ChangeDocumentTypeToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column  :vital_documents, :document_type, 'integer USING document_type::integer', default: 0  
  end
end

#https://makandracards.com/makandra/18691-postgresql-vs-rails-migration-how-to-change-columns-from-string-to-integer