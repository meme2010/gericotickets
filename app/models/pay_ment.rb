class PayMent < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :number_of_tickets, :user

  has_many :pa


end
