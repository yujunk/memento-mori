class User < ApplicationRecord
  has_many :vital_documents
  has_many :contacts

  enum role: { testator: 0, deputy: 1 }

  before_save :encrypt_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
      self.password = nil
    end
  end

  def self.authenticate(email="", password="")
    @user = User.find_by(email: email)
    if @user && @user.match_password(password)
      return @user
    else
      return false
    end
  end

  def match_password(password="")
    encrypted_password == BCrypt::Engine.hash_secret(password, salt)
  end

end

#https://www.sitepoint.com/rails-userpassword-authentication-from-scratch-part-i/

#Woops should have seen this earlier, could have just used password_digest & has_secure_password:
#https://medium.com/@tpstar/password-digest-column-in-user-migration-table-871ff9120a5
#http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
