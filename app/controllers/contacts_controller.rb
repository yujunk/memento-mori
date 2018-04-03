class ContactsController < ApplicationController
  before_action :authenticate_user

  def new
    @contact = Contact.new
  end

  def create
    byebug
    @contact = Contact.create(contact_params)

    redirect_to contacts_path(@current_user)
  end

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id]) 
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :first_name, :last_name, :birthdate, :phone_number, :address, :city, :postcode, :notes, :label, :user_id)
  end

end
