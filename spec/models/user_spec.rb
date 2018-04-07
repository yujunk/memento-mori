require 'rails_helper'
require 'byebug'

RSpec.describe User, type: :model do
  let(:proper_email)        { "hello@gmail.com" }
  let(:proper_password)     { "basic2018" }
  let(:improper_email)      { "notemail" }
  let(:improper_password)   { "ah" }

  context "validation (not using factory bot) " do
    #proper email test
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value(proper_email).for(:email) }

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
    #Attempt 1 - still wrong
    # let!(:another_user) { create :user}
    # it { should_not validate_uniqueness_of(:email)}
    
    #Attempt 2 - closer?
    it "will raise an error" do
     expect { another_user = create(:user) }.to raise_error
    end

    #Attempt 3 - 
    # it "should raise an error" do
    #   create(:user).errors[:email].should include("ActiveRecord::RecordNotUnique")
    # end

    #http://matchers.shoulda.io/docs/v3.1.1/Shoulda/Matchers/ActiveRecord.html#validate_uniqueness_of-instance_method
    #https://makandracards.com/makandra/38645-testing-activerecord-validations-with-rspec
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

  context "encrypt_password custom method" do
    let!(:user) { create :user }
    
    it "will contain an encrypted password" do
      user.encrypted_password.should be_present
    end

    it "will not save the password entered by user in the database" do
      expect { user.to have_attributes(:password => nil) }
    end

    it "will log in successfully" do
      expect{ User.authenticate(:user)}.not_to raise_error
    end
    #https://stackoverflow.com/questions/16603559/rspec-the-passwords-in-my-test-are-not-matching-up
  end

  context "match_password custom method" do
    let!(:user) { create :user }
    let!(:logging_in_user) { User.find_by(email: "johndoe@gmail.com")}

    it "will match logged in password with encrypted password in database" do
      #1) expect { logging_in_user.match_password("better2018") }.to raise_error #pass
      #2) expect { logging_in_user.match_password("better2018") }.to eq(true) #cannot use block
      expect(logging_in_user.match_password("better2018")).to eq(true) 
    end

    it "will not log in user if password is wrong" do
      # byebug
      #1) expect { logging_in_user.match_password("whatever") }.to raise_error #not pass
      #2) expect { logging_in_user.match_password("whatever") }.to eq(false) #not pass
      expect(logging_in_user.match_password("whatever")).to eq(false) 
    end

    #https://stackoverflow.com/questions/19960831/rspec-expect-vs-expect-with-block-whats-the-difference
  end

  context "authentication (ie logging in) custom method" do
    let!(:user) { create :user }
    #byebug
    let!(:logged_in_user) { User.authenticate(email: "johndoe@gmail.com", password: "better2018") }

    it "will be successful" do
      expect(logged_in_user.last_name).to eq("Doe")
    end
  end
end


#FACTORY BOT
  #http://www.rubydoc.info/gems/factory_bot/file/GETTING_STARTED.md
  #https://semaphoreci.com/community/tutorials/working-effectively-with-data-factories-using-factorygirl
  #http://railscasts.com/episodes/158-factories-not-fixtures?autoplay=true

#https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec