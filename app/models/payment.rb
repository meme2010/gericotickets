class Payment < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :number_of_tickets, :user

  belongs_to :reservation
  belongs_to :user
  belongs_to :event


end
