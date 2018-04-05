class ContactsController < ApplicationController
  before_action :authenticate_user

  def create
    @contact = Contact.new(contact_params)
    user_allowed?(action: @contact, user: @current_user)
    
    @contact.save

    redirect_to user_contacts_path(@current_user)
  end

  def index
    @contacts = Contact.where(user_id: @current_user)
  end

  def show
    @contact = Contact.find(params[:id]) 
  end

  def search
    if params[:search].blank?
      @contacts = Contact.where(user_id: @current_user)
    else
      relevant_contacts = Contact.where(user_id: @current_user)
      @contacts = relevant_contacts.search(params[:search])
      # @contacts = Contact.contacts_search_engine(params[:search])
    end

    respond_to do |format|
      format.js
      format.html { render :index }
    end

  end

  private

  def contact_params
    params.require(:user_contacts).permit(:email, :first_name, :last_name, :birthdate, :phone_number, :address, :city, :postcode, :notes, :relationship, :user_id)
  end

  def filtering_params(params)
    params.slice
  end

end
