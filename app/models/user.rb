class User < ApplicationRecord
  enum status: [ :testator, :deputy]
  
  has_many :vital_documents
  has_many :contacts

  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  # validates_length_of :password, :in => 6..20, :on => :create

  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
      self.password = nil
    end
  end

end
