require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :title, presence: true
  validates :url, :url => true

  def read?
    if self.read
      "Mark as Unread"
    else
      "Mark as Read"
    end
  end

  def self.search(search)
    if search
      where('title ILIKE ?', "%#{search}%")
    else
      all
    end
  end

  def send_email
    LinkMailer.send_link_email(self).deliver_now
  end

end
