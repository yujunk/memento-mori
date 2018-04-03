class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)

    redirect_to contacts_path
  end

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id]) 
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :first_name, :last_name, :birthdate, :phone_number, :address, :city, :postcode, :notes)
  end

end
