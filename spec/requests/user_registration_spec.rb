require 'spec_helper'

describe User do
  
  before do 
  	 @user = User.new(email: "meme2010@yahoo.com", password: "testword", password_confirmation: "testword")
  end

  subject { @user }

  it { should respond_to(:email) }






end
