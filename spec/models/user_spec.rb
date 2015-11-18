require "rails_helper"

RSpec.describe User, type: :model do
    let(:user) do
      User.new(email: "test_email@mail.com",
               password:   "password",
               password_confirmation: "password")
    end

    it "creates a user" do
      user.save

      expect(User.first.email).to eq("test_email@mail.com")
      expect(User.all.first.password_digest).to be_a(String)
    end

    it "doesn't create a user with different password confirmation" do
      invalid_user = User.new(email: "test_email@mail.com",
                              password:   "password",
                              password_confirmation: "a;lskdfjasdf")

      invalid_user.save

      expect(User.count).to eq(0)
    end

end

