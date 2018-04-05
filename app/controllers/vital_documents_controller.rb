class VitalDocumentsController < ApplicationController
  before_action :authenticate_user

  def index
    @contacts = Contact.all
  end

  def new
  end

  def create
  end
end
