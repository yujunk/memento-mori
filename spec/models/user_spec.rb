require 'rails_helper'

RSpec.describe User, type: :model do
  let(:proper_email)        { "hello@gmail.com" }
  let(:proper_password)     { "basic2018" }
  let(:improper_email)      { "notemail" }
  let(:improper_password)   { "ah" }

  context "validation (not using factory bot) " do
    #proper email test
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value(proper_email).for(:email) }
    # it { should validate_uniqueness_of(:email)}

    #improper email test
    it { is_expected.not_to allow_value(improper_email).for(:email)  }

    #proper password test
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to allow_value(proper_password).for(:password) }

    #improper password test
    it { is_expected.not_to allow_value(improper_password).for(:password)  }
  end 

  context "validation (using factory bot) for email uniqueness test" do
   let!(:user) { create :user }
   it { should validate_uniqueness_of(:email)}
  end

  context "validation (using factory bot) should NOT pass email uniqueness test" do
    let!(:user) { create :user }
    let!(:another_user) { create :user}
    it { should_not validate_uniqueness_of(:email)}
    #http://matchers.shoulda.io/docs/v3.1.1/Shoulda/Matchers/ActiveRecord.html#validate_uniqueness_of-instance_method
  end

  context "validation (using factory bot) that presence of first and last name is true " do
    let!(:user) { create :user }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end
  
  context "all users associations" do 
    it { should have_many(:vital_documents) }
    it { should have_many(:contacts) }
  end

  context "models" do
    it do
     should define_enum_for(:role). 
      with([:testator, :deputy])
    end
  end

  context "password should be encrypted and saved in database because it" do
    let!(:user) { create :user }
    
    it "will log in successfully" do
      expect{ User.authenticate(:user)}.not_to raise_error
    end
    #https://stackoverflow.com/questions/16603559/rspec-the-passwords-in-my-test-are-not-matching-up
  end

  context "user log ins" do
    let!(:user) { create :user }

    it "will be successful when username and password is correct" do
    end

    it "will NOT be successful when username and password is incorrect" do
    end
  end

end


#FACTORY BOT
  #http://www.rubydoc.info/gems/factory_bot/file/GETTING_STARTED.md
  #https://semaphoreci.com/community/tutorials/working-effectively-with-data-factories-using-factorygirl
  #http://railscasts.com/episodes/158-factories-not-fixtures?autoplay=true