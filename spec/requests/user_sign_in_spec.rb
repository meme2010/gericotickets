require "spec_helper"

describe "user sign in" do
  it "allows users to sign in after they have registered" do
    user = User.create(:email    => "emerson@test.com",
                       :password => "caca2010")

    visit "/users/sign_in"

    fill_in "Email",    :with => "emerson@test.com"
    fill_in "Password", :with => "caca2010"

    click_button "Sign in"

    page.should have_content("Signed in successfully.")
  end
end