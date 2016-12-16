require "rails_helper"

RSpec.describe User, :type => :model do
  it "user is logged in when there exists session for the user" do
    user = User.create!(email: "user@test.com")
    session = Session.create!(user: user)

    expect(user.logged_in?).to be true
    session.destroy!
    expect(user.logged_in?).to be false
  end
end
