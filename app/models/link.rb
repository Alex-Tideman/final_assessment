require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :title, presence: true
  validates :url, :url => true

  def read?
    if self.read == false
      "Mark as Read"
    else
      "Mark as Unread"
    end
  end


end
