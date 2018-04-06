require 'rails_helper'

RSpec.describe User, type: :model do
  let(:proper_email)        { "hello@gmail.com" }
  let(:proper_password)     { "basic2018" }
  let(:improper_email)      { "notemail" }
  let(:improper_password)   { "ah" }

  context "validation (not using factory bot): " do
    #proper email test
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value(proper_email).for(:email) }
    it { is expected.to should validate_uniqueness_of(:email)}

    #improper email test
    it { is_expected.not_to allow_value(improper_email).for(:email)  }

    #proper password test
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to allow_value(proper_password).for(:password) }

    #improper password test
    it { is_expected.not_to allow_value(improper_password).for(:password)  }
  end 

end


#Factory bot
#https://semaphoreci.com/community/tutorials/working-effectively-with-data-factories-using-factorygirl
#http://railscasts.com/episodes/158-factories-not-fixtures?autoplay=true