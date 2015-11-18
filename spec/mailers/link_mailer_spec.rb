require "rails_helper"

RSpec.describe LinkMailer, type: :mailer do
    scenario "Seller receives email when a new bid" do

      @user = User.create(email: "test@mail.com",password: "password",password_confirmation: "password")
      @link = Link.create(url:"espn.com",title:"Sports",user_id:@user.id,outbound_email:"receive@mail.com")

      mail = LinkMailer.send_link_email(@link)
      assert_equal "You have a new link to check out!", mail.subject
      assert_equal ["receive@mail.com"], mail.to
      assert_equal ["admin@spinboard.com"], mail.from
      assert_match "Check out this link", mail.body.encoded
    end

end
