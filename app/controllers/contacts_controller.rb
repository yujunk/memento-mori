class ContactsController < ApplicationController
  before_action :authenticate_user

  def create
    user_allowed?(action: @contact, user: current_user)
    
    @contact = Contact.new(contact_params)
  
    respond_to do |format|
      if @contact.save
        format.html { redirect_to user_contacts_path(current_user), :flash => { success: 'Contact successfully created.' }}
      else
        format.json {}
      end
    end

    #RELATED ERRORS?
    #https://stackoverflow.com/questions/4789613/ajax-500-internal-server-error?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
    #https://stackoverflow.com/questions/12195883/jquery-ajax-is-sending-get-instead-of-post?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

    #FORM_FOR REMOTE TRUE
    #https://stackoverflow.com/questions/13893011/add-remote-true-on-form-for
    
    #EXTRA READING
    #https://medium.com/@codenode/how-to-use-remote-true-to-make-ajax-calls-in-rails-3ecbed40869b
    #http://guides.rubyonrails.org/working_with_javascript_in_rails.html
    #https://medium.com/@AdamKing0126/ajax-and-rails-demystifying-remote-true-fe51ba2ce819

  end

  def index
    @contacts = Contact.where(user_id: current_user)
  end

  def show
    @contact = Contact.find(params[:id]) 
  end

  def search
    if params[:search].blank?
      @contacts = Contact.where(user_id: current_user)
    else
      relevant_contacts = Contact.where(user_id: current_user)
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

end
