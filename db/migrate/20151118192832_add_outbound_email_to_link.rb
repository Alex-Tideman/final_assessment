class AddOutboundEmailToLink < ActiveRecord::Migration
  def change
    add_column :links, :outbound_email, :string
  end
end
