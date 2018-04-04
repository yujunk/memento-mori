class ContactsController < ApplicationController
  before_action :authenticate_user

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save

    redirect_to contacts_path(@current_user)
  end

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id]) 
  end

  def search
    if params[:search].blank?
      @contacts = Contact.all
    else
      @contacts = Contact.search(params[:search])
      # @contacts = Contact.contacts_search_engine(params[:search])
    end

    respond_to do |format|
      format.js
      format.html { render :index }
    end

  end

  private

  def contact_params
    params.require(:contact).permit(:email, :first_name, :last_name, :birthdate, :phone_number, :address, :city, :postcode, :notes, :relationship, :user_id)
  end

  def filtering_params(params)
    params.slice
  end

end
