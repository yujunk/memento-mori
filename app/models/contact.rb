class Contact < ApplicationRecord
  belongs_to :user

  include PgSearch
  pg_search_scope :contacts_search_engine, :against => {
    :first_name => 'A',
    :last_name => 'B', 
    :relationship => 'C',
    :city => 'C'
  }
end
