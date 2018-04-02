class User < ApplicationRecord
  enum status: [ :testator, :deputy]
  
  has_many :vital_documents
  has_many :contacts
end
