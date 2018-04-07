class VitalDocumentsController < ApplicationController
  before_action :authenticate_user

  def index
    @vital_documents = VitalDocument.all
  end

  def new
  end

  def create
  end
end
