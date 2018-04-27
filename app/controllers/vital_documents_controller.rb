class VitalDocumentsController < ApplicationController
  before_action :authenticate_user

  def index
    @vital_documents = VitalDocument.all
  end

  def new
  end

  def create
    @vital_document = VitalDocument.new(vital_document_params)

    respond_to do |format|
      if @vital_document.save
        format.html { redirect_to user_vital_documents_path(current_user), :flash => { success: 'Document successfully saved.' }}
      else
        format.html { redirect_to user_vital_documents_path(current_user), :flash => { danger: 'Something went wrong. Document not saved.' }}
      end
    end
  end

  private

  def vital_document_params
    params.require(:user_vital_documents).permit(:identification_number, :country_of_issue, :expiration_date, :paperwork_location, :instructions, :doc_upload, :user_id, :document_type, :issue_date, {doc_uploads: []})
  end
end
