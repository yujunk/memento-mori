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
    @contacts = Contact.all
    
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :first_name, :last_name, :birthdate, :phone_number, :address, :city, :postcode, :notes, :relationship, :user_id)
  end

  def filtering_params(params)
    params.slice
  end

end
