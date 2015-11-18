require "rails_helper"

RSpec.describe Link, type: :model do
  let(:user) do
    User.new(email: "test_email@mail.com",
             password:   "password",
             password_confirmation: "password")
  end

  let(:link) do
    Link.new(url: "http://espn.com",
             title: "Sports",
              user_id:user.id)
  end

  it "creates a link" do
    user.save
    link.save

    expect(Link.first.url).to eq("http://espn.com")
    expect(Link.first.title).to eq("Sports")
    expect(Link.first.user.email).to eq("test_email@mail.com")
    expect(Link.first.outbound_email).to eq(nil)
  end

  it "doesn't create a link with an invalid url" do
    user.save
    invalid_url = Link.new(url: "asdfas.com",
                           title: "Junk",
                           user_id:user.id)

    invalid_url.save
    expect(Link.count).to eq(0)

  end

  it "updates a link" do
    user.save
    link.save

    link.update_attributes(url: "http://cnn.com")

    expect(Link.first.url).to eq("http://cnn.com")
    expect(Link.first.title).to eq("Sports")
    expect(Link.first.user.email).to eq("test_email@mail.com")
    expect(Link.first.outbound_email).to eq(nil)
  end

  it "doesn't update a link with an invalid url" do
    user.save
    link.save

    link.update_attributes(url: "cnn.com")

    expect(Link.first.url).to eq("http://espn.com")
    expect(Link.first.title).to eq("Sports")
    expect(Link.first.user.email).to eq("test_email@mail.com")
    expect(Link.first.outbound_email).to eq(nil)
  end

end


