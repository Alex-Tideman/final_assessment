class LinkMailer < ApplicationMailer
  def send_link_email(link)
    @link = link
    mail(
        to: @link.outbound_email,
        subject: "You have a new link to check out!",
    )
  end
end
