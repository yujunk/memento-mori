class Contact < ApplicationRecord
  belongs_to :user

  # include PgSearch
  # pg_search_scope :contacts_search_engine, :against => {
  #   :first_name => 'A',
  #   :last_name => 'B', 
  #   :relationship => 'C',
  #   :city => 'D'
  # }

  # pg_search_scope :contacts_search_engine, :against => [:first_name, :last_name, :relationship, :city, :email]

  def self.search(params)
    contacts = Contact.where("lower(first_name) LIKE ? or lower(last_name) LIKE ? or lower(relationship) LIKE ? or lower(city) LIKE ? or lower(email) LIKE ?", "%#{params.downcase}%", "%#{params.downcase}%", "%#{params.downcase}%", "%#{params.downcase}%", "%#{params.downcase}%")
    contacts
  end

end
